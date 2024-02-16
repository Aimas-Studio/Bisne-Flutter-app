import 'package:get/get.dart';

class ProductPageController extends GetxController {
  ProductPageController();

  final _count = 1.obs;
  final List<String> images = [
    'assets/Images/shop2.png',
    'assets/Images/shop2.png',
    'assets/Images/shop2.png'
  ];
  final String shopName = 'Chocothay';
  final String shopImage = 'assets/Images/shop2.png';
  final String name = 'Bombones rellenos de fresa';
  final String description =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa.';
  final int price = 300;
  final double rate = 4.5;

  set count(value) => this._count.value = value;
  get count => this._count.value;
}
