import 'dart:async';

import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:bisne/src/models/shop/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/presentation/controllers/cart_page_controller.dart';

final cartController = CartController();

class ShopPageController extends GetxController {
  final idController = 'ShopPageController';
  final Shop shop;
  final selectedIndex = 0.obs;
  ShopPageController({required this.shop}) : super();

  final cart = cartController.itemsToBuy;
  final int viewsCount = 1200;
  final String rate = '4.5';
  final Map<String, dynamic> contact = {
    'phoneNumber': '53314213',
    'whatsapp': '53314213',
    'facebook': 'Chocolatería ChocoThay',
    'instagram': 'Chocothay.cuba',
    'link': 'https://www.google.com/',
  };
  final String localitation = 'Playa, La Habana';
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
}
