import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../products/export.dart';

final persistentData = PersistentData();

class CartController extends GetxController {
  static final _cartController = CartController._();

  factory CartController() {
    return _cartController;
  }

  CartController._();

  static const idController = 'cartController';
  final Map<Product, int> itemsToBuy = {};

  final TextEditingController textPhoneNumberController =
      TextEditingController(text: persistentData.userPhone);
  final TextEditingController textUserNameController =
      TextEditingController(text: persistentData.userName);
  final TextEditingController textAddressController =
      TextEditingController(text: persistentData.userAddress);

  void addProduct(Product product, int quantity) {
    if (itemsToBuy.containsKey(product)) {
      itemsToBuy[product] = itemsToBuy[product]! + quantity;
    } else {
      itemsToBuy[product] = quantity;
      update([idController]);
    }
  }

  void removeProduct(Product product) {
    if (itemsToBuy[product]! > 1) {
      itemsToBuy[product] = itemsToBuy[product]! - 1;
    } else {
      itemsToBuy.remove(product);
      update([idController]);
    }
  }

  double getBuyPrice() {
    return itemsToBuy.isNotEmpty
        ? itemsToBuy.keys
            .map((product) => product.price * itemsToBuy[product]!)
            .reduce((value, element) => value + element)
        : 0.0;
  }
}
