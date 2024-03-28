import 'package:bisne/src/models/cart/domain/dtos/cart_dto.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../products/export.dart';
import '../../services/cart_buy.dart';

final _persistentData = PersistentData();

class CartController extends GetxController {
  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'phoneNumber': FormControl<String>(validators: [Validators.required]),
    'mensajeria': FormControl<String>(validators: [Validators.required]),
  });

  static final _cartController = CartController._();

  factory CartController() {
    return _cartController;
  }

  CartController._();

  static const idController = 'cartController';
  final Map<Product, int> itemsToBuy = {};

  final TextEditingController textPhoneNumberController =
      TextEditingController(text: _persistentData.userPhone);
  final TextEditingController textUserNameController =
      TextEditingController(text: _persistentData.userName);
  final TextEditingController textAddressController =
      TextEditingController(text: _persistentData.userAddress);

  void addProduct(Product product, int quantity) {
    if (itemsToBuy.containsKey(product)) {
      itemsToBuy[product] = itemsToBuy[product]! + quantity;
    } else {
      itemsToBuy[product] = quantity;
      update([idController]);
    }
    setBuyPrice();
  }

  void removeProduct(Product product) {
    if (itemsToBuy[product]! > 1) {
      itemsToBuy[product] = itemsToBuy[product]! - 1;
    } else {
      itemsToBuy.remove(product);
      update([idController]);
    }
    setBuyPrice();
  }

  void deleteProduct(Product product) {
    itemsToBuy.remove(product);
    update([idController]);
    setBuyPrice();
  }

  RxDouble buyPrice = 0.0.obs;

  void setBuyPrice() {
    buyPrice.value = itemsToBuy.isNotEmpty
        ? itemsToBuy.keys
            .map((product) => product.price * itemsToBuy[product]!)
            .reduce((value, element) => value + element)
        : 0.0;
  }

  void Buy(BuildContext context) async {
    final cartDTo = cartDTO(
        addressToSend: form.control('mensajeria').value,
        date: DateTime.now().toString(),
        userId: PerData.idUser,
        items: itemsToBuy);

    if (await MakeBuy(cartDTo)) {
      itemsToBuy.clear();
      update([idController]);
      Navigator.pop(context);
      // Get.showSnackbar(const GetSnackBar(
      //     message: 'Compra completada', duration: Duration(seconds: 2)));
//       final baseController = Get.find<BasePageController>();
//       final homeController = Get.find<HomePageController>();
//       homeController.setLogin();
//       baseController.obj = 2;
//     } else {
//       Get.showSnackbar(const GetSnackBar(
//         message: 'Error',
//         duration: Duration(seconds: 2),
//       ));
    }
  }
}
