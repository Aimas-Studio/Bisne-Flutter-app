import 'package:get/get.dart';

import '../../core/Utils/Entities/product.dart';

class CartController extends GetxController {
  CartController();

  final RxMap itemsToBuy = {}.obs;

  void addItem(ProductDump product, int quantity) {
    if (itemsToBuy.containsKey(product)) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value + quantity;
    } else {
      itemsToBuy[product]!.value = quantity;
    }
  }

  void removeItem(ProductDump product) {
    if (itemsToBuy[product]!.value > 1) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value - 1;
    } else {
      itemsToBuy.remove(product);
    }
  }
}
