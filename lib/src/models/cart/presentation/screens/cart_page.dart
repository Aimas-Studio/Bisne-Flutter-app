import 'package:bisne/src/models/base/presentation/controllers/base_page_controller.dart';
import 'package:bisne/src/models/cart/presentation/widgets/buy_info_widget.dart';
import 'package:bisne/src/models/cart/presentation/widgets/product_item_cart.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../products/export.dart';
import '../controllers/cart_page_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BasePageController>().showBottomNavBar = false;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BasePageController>().showBottomNavBar = true;
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CartController(),
      id: CartController.idController,
      builder: (controller) => ReactiveForm(
        formGroup: controller.form,
        child: Scaffold(
          appBar: CustomAppBar(),
          backgroundColor: fontAppColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getProductsCartWidget(controller.itemsToBuy)
                    ..addAll([
                      const RegularAppText(
                        text: 'Nombre',
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 55,
                        child: ReactiveTextField(
                          formControlName: 'name',
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: InputBorder.none,
                              hintText: 'Tu nombre',
                              hintStyle: TextStyle(fontSize: 20),
                              alignLabelWithHint: true),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const RegularAppText(
                        text: 'Teléfono',
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 55,
                        child: ReactiveTextField(
                          formControlName: 'phoneNumber',
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              border: InputBorder.none,
                              hintText: PerData.userPhone == ''
                                  ? 'Tu teléfono'
                                  : PerData.userPhone,
                              hintStyle: const TextStyle(fontSize: 20),
                              alignLabelWithHint: true),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const RegularAppText(
                        text: '¿Desea mensajería?',
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 130,
                        child: ReactiveTextField(
                          formControlName: 'mensajeria',
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: InputBorder.none,
                              hintText: 'Ej: si, para calle 50 entre 35 y 37',
                              hintStyle: TextStyle(fontSize: 20),
                              alignLabelWithHint: true),
                        ),
                      ),
                      const SizedBox(
                        height: 110,
                      )
                    ])),
            ),
          ),
          bottomSheet: ReactiveFormConsumer(
              builder: (context, form, child) => BuyInfoCartWidget(
                    controller: controller,
                    isValid: form.valid,
                  )),
        ),
      ),
    );
  }

  List<Widget> getProductsCartWidget(Map<Product, int> products) {
    List<Widget> result = [];
    products.forEach((product, amount) {
      result
        ..add(
            ProductItemCart(product: product, deleteFunction: showAlertDialog))
        ..add(const Divider());
    });
    return result;
  }
}

Future<dynamic> showAlertDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar producto'),
        content: const Text(
            '¿Estás seguro de que quieres eliminar este producto de tu lista de compras?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // Cierra el diálogo
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              Navigator.of(context).pop(true); // Cierra el diálogo
            },
          ),
        ],
      );
    },
  );
}
