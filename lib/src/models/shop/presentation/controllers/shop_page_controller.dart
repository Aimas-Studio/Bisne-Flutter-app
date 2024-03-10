import 'dart:async';

import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/presentation/controllers/cart_page_controller.dart';

final cartController = CartController();

class ShopPageController extends IndexButtonController {
  ShopPageController(
      {required this.category,
      required this.subcategories,
      required this.openingHours,
      required this.name,
      required this.descripcion,
      required this.image})
      : super();
  final String image;
  final cart = cartController.itemsToBuy;
  final int viewsCount = 1200;
  final String rate = '4.5';
  final String category;
  final List<String> subcategories;
  final List<String> openingHours;
  final Map<String, dynamic> contact = {
    'phoneNumber': '53314213',
    'whatsapp': '53314213',
    'facebook': 'Chocolatería ChocoThay',
    'instagram': 'Chocothay.cuba',
    'link': 'https://www.google.com/',
  };
  final String localitation = 'Playa, La Habana';
  final String name;
  final bool favorito = false;
  final String descripcion;

  @override
  RxInt indexButton = 0.obs;

  final _streamController = StreamController<int>();

  @override
  void onInit() {
    super.onInit();
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
    return NetworkImage(image);
  }
}
