import 'dart:async';

import 'package:bisne/src/core/infrastructure/graphql/graphql_config.dart';
import 'package:bisne/src/models/home/infrastructure/graphql/query.dart';
import 'package:bisne/src/models/home/test/shops.dart';
import 'package:bisne/src/models/shop/export.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/domain/entities/categories/categories.dart';
import '../../home/presentations/controllers/home_page_controller.dart';
import '../../products/domain/entities/product_entity.dart';
import '../../products/infrastructure/graphql/mutations.dart';
import '../../shop/infrastructure/graphql/mutations.dart';

class FavoritePageController extends GetxController {
  FavoritePageController();
  static const id = 'favoritePage';
  final selectedIndex = 0.obs;

  Future<List<Product?>> fetchProducts() async {
    final QueryOptions favoriteOptions = QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: getFavoriteProducts,
      variables: {'id': PerData.idUser},
    );
    // print(Env.apiUrl);
    final QueryResult resultProducts = await client.query(favoriteOptions);

    if (resultProducts.hasException) {
      return [];
    }

    final oferts = Future.wait(
        (resultProducts.data!['usuarioOfertasFav'] as List).map((data) async {
      try {
        final QueryOptions shopOptions = QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: getShopById,
          variables: {'id': data['tiendaId']},
        );
        final QueryResult resultShops = await client.query(shopOptions);
        return Product.fromMap(
            data as Map<String, dynamic>,
            Shop.fromMap(resultShops.data!['tienda'], '', false),
            categories
                .map((id, name) => MapEntry(name, id))[data['categoriaId']]!,
            '',
            true);
      } catch (e) {
        return null;
      }
    }).toList());
    return oferts;
  }

  Future<List<Shop?>> fetchShops() async {
    final QueryOptions options = QueryOptions(
        document: getFavoriteShops,
        variables: {'userId': PerData.idUser},
        fetchPolicy: FetchPolicy.networkOnly);

    // print(Env.apiUrl);
    final QueryResult resultShop = await client.query(options);

    if (resultShop.hasException) {
      return [];
    }

    final tiendas = Future.wait(
        (resultShop.data?['usuarioTiendasFav'] as List).map((data) async {
      final QueryOptions categoryOptions = QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: getCategory,
        variables: {'id': data['id']},
      );
      try {
        final QueryResult resultCategory = await client.query(categoryOptions);

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
                resultCategory.data!['tiendaCategoria']['nombre'], true);
      } catch (e) {
        return data == null
            ? null
            : Shop.fromMap(data as Map<String, dynamic>, '', false);
      }
    }).toList());
    return tiendas;
  }

  final _itemsStreamController = StreamController<List<List<dynamic>>>();

  Stream<List<List<dynamic>>> get itemsStream => _itemsStreamController.stream;

  loadItems() async {
    List<Shop?> shops = await fetchShops();
    List<Product?> products = await fetchProducts();
    print('recarga');
    _itemsStreamController.add([shops, products]);
  }

  @override
  void onClose() {
    _itemsStreamController.close();
    super.onClose();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    loadItems();
    super.update(ids, condition);
  }
}
