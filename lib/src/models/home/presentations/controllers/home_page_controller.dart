import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:bisne/src/models/user/export.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../infrastructure/graphql/query.dart';

final data = PersistentData();

class HomePageController extends GetxController {
  static const idController = "homePageController";
  var login = data.loggedIn;

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
    final QueryOptions options = QueryOptions(
      document: getAllShops,
    );

    // print(Env.apiUrl);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      return [];
    }
    final tiendas = (result.data?['tiendas'] as List).map((data) {
      return data == null ? null : Shop.fromMap(data as Map<String, dynamic>);
    }).toList();
    return tiendas;
  }
}
