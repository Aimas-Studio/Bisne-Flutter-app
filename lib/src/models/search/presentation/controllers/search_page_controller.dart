import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../home/infrastructure/graphql/query.dart';
import '../../../shop/domain/entities/shop_entity.dart';

class SearchPageController extends GetxController {
  SearchPageController();
  final _streamController = StreamController<int>();
  var selectedIndex = 0.obs;

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

  @override
  void onInit() {
    super.onInit();
    selectedIndex.listen((index) {
      _streamController.add(index);
    });
  }

  Stream<int> get indexStream => _streamController.stream;

  @override
  void onClose() {
    super.onClose();
    _streamController.close();
  }
}
