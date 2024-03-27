import 'package:bisne/src/core/infrastructure/graphql/graphql_config.dart';
import 'package:bisne/src/models/home/infrastructure/graphql/query.dart';
import 'package:bisne/src/models/shop/export.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FavoritePageController extends GetxController {
  FavoritePageController();
  final selectedIndex = 0.obs;
  Future<List<Shop?>> fetchShops() async {
    final QueryOptions options = QueryOptions(
      document: getAllShops,
    );

    // print(Env.apiUrl);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      return [];
    }

    final tiendas = (result.data?['tiendas'] as List)
        .map((data) => data == null
            ? null
            : Shop.fromMap(data as Map<String, dynamic>, ''))
        .toList();
    return tiendas;
  }
}
