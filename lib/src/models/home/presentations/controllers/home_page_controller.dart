import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../infrastructure/graphql/query.dart';

class HomePageController extends GetxController {
  static const idController = "homePageController";

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
    print(result.data?['tiendas'][1]['nombre']);
    final tiendas = (result.data?['tiendas'] as List).map((data) {
      print(data);

      return data == null ? null : Shop.fromMap(data as Map<String, dynamic>);
    }).toList();
    return tiendas;
  }
}
