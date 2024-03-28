import 'dart:async';

import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:bisne/src/models/shop/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/domain/entities/categories/categories.dart';
import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../cart/presentation/controllers/cart_page_controller.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/infrastructure/graphql/mutations.dart';

final cartController = CartController();

class ShopPageController extends GetxController {
  static const idController = 'ShopPageController';
  final Shop shop;
  final selectedIndex = 0.obs;
  ShopPageController({required this.shop}) : super();

  final cart = cartController.itemsToBuy;
  final int viewsCount = 1200;
  final String rate = '4.5';

  final bool favorito = false;
  RxInt indexButton = 0.obs;

  final _streamController = StreamController<int>();

  @override
  void onInit() {
    super.onInit();
    // scrollController.addListener(_scrollListener);
    indexButton.listen((index) {
      _streamController.add(index);
    });
  }

  Stream<int> get indexStream => _streamController.stream;

  @override
  void onClose() {
    super.onClose();
    _streamController.close();
  }

  ImageProvider takeImage() {
    return customNetworkImage(shop.imageUrl);
  }

  bool isExpanded = false;

  Future<List<Product?>> fetchProducts() async {
    final QueryOptions options = QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: getAllProducts,
      variables: {'shopId': shop.id},
    );

    // print(Env.apiUrl);
    final QueryResult resultTiendas = await client.query(options);

    if (resultTiendas.hasException) {
      return [];
    }
    final oferts = Future.wait(
        (resultTiendas.data!['tiendaOfertas'] as List).map((data) async {
      try {
        final QueryOptions labelOptions = QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: getLabelName,
          variables: {'labelId': data['etiquetaId']},
        );
        final QueryOptions favoriteOptions = QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: getFavoriteProducts,
          variables: {'id': PerData.idUser},
        );

        final QueryResult resultLabel = await client.query(labelOptions);
        final QueryResult resultFavorite = await client.query(favoriteOptions);

        var isFavorite = false;
        for (var shop in resultFavorite.data!['usuarioOfertasFav']) {
          if (shop['id'] == data['id']) isFavorite = true;
        }

        if (resultLabel.hasException) {
          return null;
        }
        if (!(shop.subcategories
            .contains(resultLabel.data!['etiqueta']['nombre']))) {
          shop.subcategories.add(resultLabel.data!['etiqueta']['nombre']);
        }
        return Product.fromMap(
            data as Map<String, dynamic>,
            shop,
            categories
                .map((id, name) => MapEntry(name, id))[data['categoriaId']]!,
            resultLabel.data!['etiqueta']['nombre'],
            isFavorite);
      } catch (e) {
        return null;
      }
    }).toList());
    return oferts;
  }
}
