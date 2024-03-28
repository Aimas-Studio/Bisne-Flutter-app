import 'dart:async';

import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:bisne/src/models/shop/infrastructure/graphql/mutations.dart';
import 'package:bisne/src/models/user/export.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../infrastructure/graphql/query.dart';

final PerData = PersistentData();

class HomePageController extends GetxController {
  static const idController = "homePageController";
  var login = PerData.loggedIn;

  void setLogin() {
    login = true;
    update([idController]);
  }

  void setLogout() {
    login = false;
    update([idController]);
  }

  HomePageController();

  Future<List<Shop?>> fetchShops() async {
    print('recargando');
    final QueryOptions options = QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: getAllShops,
    );

    // print(Env.apiUrl);
    final QueryResult resultShop = await client.query(options);

    if (resultShop.hasException) {
      return [];
    }

    final tiendas =
        Future.wait((resultShop.data?['tiendas'] as List).map((data) async {
      final QueryOptions categoryOptions = QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: getCategory,
        variables: {'id': data['id']},
      );
      try {
        final QueryOptions favoriteOptions = QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: getFavorite,
          variables: {'id': PerData.idUser},
        );

        final QueryResult resultCategory = await client.query(categoryOptions);
        final QueryResult resultFavorite = await client.query(favoriteOptions);

        var isFavorite = false;
        for (var shop in resultFavorite.data!['usuarioTiendasFav']) {
          if (shop['id'] == data['id']) isFavorite = true;
        }

        if (resultCategory.hasException) {
          print(
              'No se encontró la categoría para la tienda: ${data['nombre']}');
          return data == null
              ? null
              : Shop.fromMap(data as Map<String, dynamic>, '', false);
        }
        return data == null
            ? null
            : Shop.fromMap(data as Map<String, dynamic>,
                resultCategory.data!['tiendaCategoria']['nombre'], isFavorite);
      } catch (e) {
        return data == null
            ? null
            : Shop.fromMap(data as Map<String, dynamic>, '', false);
      }
    }).toList());
    return tiendas;
  }

  final _shopsStreamController = StreamController<List<Shop?>>();

  Stream<List<Shop?>> get shopsStream => _shopsStreamController.stream;

  loadShops() async {
    List<Shop?> shops = await fetchShops();
    _shopsStreamController.add(shops);
  }

  @override
  void onClose() {
    _shopsStreamController.close();
    super.onClose();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    loadShops();
    super.update(ids, condition);
  }
}
