import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/Entities/shop.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartController();
  final Map<ProductDump, RxInt> itemsToBuy = {
    ProductDump(
      'Cerveza',
      20,
      'assets/Images/shop2.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 2.obs,
    ProductDump(
      'Bombones Rellenos',
      150,
      'assets/Images/shop1.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 1.obs,
    ProductDump(
      'Chocolate Blanco',
      200,
      'assets/Images/shop2.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 2.obs,
    ProductDump(
      'Chocolate Blanco',
      200,
      'assets/Images/shop2.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 2.obs,
    ProductDump(
      'Chocolate Blanco',
      200,
      'assets/Images/shop2.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 2.obs,
    ProductDump(
      'Chocolate Blanco',
      200,
      'assets/Images/shop2.png',
      "",
      ShopDump('Bar', 'assets/Images/shop2.png'),
    ): 2.obs,
  };

  void addItem(ProductDump product, int quantity) {
    if (itemsToBuy.containsKey(product)) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value + quantity;
    } else {
      itemsToBuy[product]!.value = quantity;
    }
  }

  void removeItem(ProductDump product) {
    if (itemsToBuy[product]! > 0) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value - 1;
    } else {
      print("No se puede eliminar");
    }
  }
}
