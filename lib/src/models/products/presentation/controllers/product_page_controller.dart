import 'package:bisne/src/models/cart/presentation/controllers/cart_page_controller.dart';
import 'package:get/get.dart';

import '../../entities/product_entitiy.dart';

class ProductPageController extends GetxController {
  final Product product;
  final CartController cartController = Get.find<CartController>();
  ProductPageController({required this.product});
  get topPosition {
    return 1;
  }

  final _count = 1.obs;
  final List<String> images = [
    'assets/Images/shop2.png',
    'assets/Images/shop2.png',
    'assets/Images/shop2.png'
  ];
  final String name = 'Chocothay';
  final String shopImage = 'assets/Images/shop2.png';
  final String Shopname = 'Bombones rellenos de fresa';
  final String description =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa.';
  final double price = 300;
  final double rate = 4.5;

  set count(value) => _count.value = value;

  get count => _count.value;

  void removeItem() {
    count > 1 ? count-- : count = 1;
  }

  void addItem() {
    count++;
  }

  void addToCart() {
    cartController.addProduct(product, count);
  }
}
