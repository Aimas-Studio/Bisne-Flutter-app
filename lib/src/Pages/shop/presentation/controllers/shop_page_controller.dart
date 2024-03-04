import 'dart:async';

import 'package:bisne/src/Pages/Cart/cart_page_controller.dart';
import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:get/get.dart';

class ShopPageController extends IndexButtonController {
  final cart = Get.find<CartController>().itemsToBuy;
  final int viewsCount = 1200;
  final double rate = 4.5;
  final List<String> categories = [
    'Alimentos',
    "Tecnologia",
    "Agro",
    'Alimentos',
    "Tecnologia",
    "Agro",
    'Alimentos',
    "Tecnologia",
    "Agro",
    'Alimentos',
    "Tecnologia",
    "Agro"
  ];
  final List<String> openingHours = [
    'De lunes a viernes. 7 AM - 11 PM',
    'Sábados y domingos. 10 AM - 2 PM'
  ];
  final Map<String, dynamic> contact = {
    'phoneNumber': '53314213',
    'whatsapp': '53314213',
    'facebook': 'Chocolatería ChocoThay',
    'instagram': 'Chocothay.cuba',
    'link': 'https://www.google.com/',
  };
  final String localitation = '29F No.7416 / 74 y 76, Playa, La Habana';
  final String name = 'ChocoThay';
  final bool mensajeria = true;
  final bool favorito = false;
  final String descripcion =
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa.";

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
}
