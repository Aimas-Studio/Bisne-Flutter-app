import 'package:get/get.dart';

import '../../../products/export.dart';

class CartController extends GetxController {
  CartController();

  final RxMap itemsToBuy = {}.obs;

  void addItem(Product product, int quantity) {
    if (itemsToBuy.containsKey(product)) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value + quantity;
    } else {
      itemsToBuy[product]!.value = quantity;
    }
  }

  void removeItem(Product product) {
    if (itemsToBuy[product]!.value > 1) {
      itemsToBuy[product]!.value = itemsToBuy[product]!.value - 1;
    } else {
      itemsToBuy.remove(product);
    }
  }
}
