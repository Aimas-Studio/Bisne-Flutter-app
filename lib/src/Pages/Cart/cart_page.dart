import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:bisne/src/Pages/Cart/cart_page_controller.dart';
import 'package:bisne/src/Pages/Cart/imputs_info_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/Utils/Entities/product.dart';
import '../../core/Utils/custom_icons.dart';
import '../../core/Utils/interfaces.dart';
import '../../core/Utils/texts.dart';
import '../../core/widgets/circular_image.dart';
import '../../core/widgets/secondary_app_bar.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final BasePageController _basePageController = Get.find<BasePageController>();
  final TextEditingController _textPhoneNumberController =
      TextEditingController(text: '54252449');
  final TextEditingController _textUserNameController =
      TextEditingController(text: 'Lucía');
  final TextEditingController _textAddressController =
      TextEditingController(text: '74 /21 y 23, Playa');
  final CartController _ = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _basePageController.showBottomNavBar.value = false;
    });
    const bottomHeight = 100.0;
    return Scaffold(
      appBar: secondaryAppBar(context, true),
      backgroundColor: backgroundAppColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        physics: const BouncingScrollPhysics(),
        child: Obx(() => Column(
              children: productsItems(context, _)
                ..add(requiredInfo(context, bottomHeight)),
            )),
      ),
      bottomSheet: Obx(() => buyButton(bottomHeight, context)),
    );
  }

  Container buyButton(double bottomHeight, BuildContext context) {
    return Container(
      height: bottomHeight,
      width: context.width,
      padding:
          EdgeInsets.symmetric(horizontal: context.width * 0.1, vertical: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thinAppText('Total', 14),
              regularAppText('${sumOfItems()} mm', 27),
              thinAppText('No incluye el precio de la mensajería', 14)
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
              width: 200,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bisneColorPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('COMPRAR',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              )),
        )
      ]),
    );
  }

  List<Widget> productsItems(BuildContext context, CartController _) {
    return _.itemsToBuy.keys.map((product) {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            productItemCart(context, _, product),
            Divider(
              indent: context.width * 0.35,
              endIndent: context.width * 0.3,
            )
          ],
        ),
      );
    }).toList();
  }

  Widget requiredInfo(BuildContext context, double bottomHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                boldAppText('Datos requeridos', 30),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListBody(
                children: [
                  inputTextCartWidget(context, 'Teléfono', Icons.phone,
                      controller: _textPhoneNumberController),
                  inputTextCartWidget(context, 'Nombre', Icons.person,
                      controller: _textUserNameController),
                  inputTextCartWidget(context, 'Mensajería', CustomIcons.truck,
                      controller: _textAddressController),
                ],
              ),
            ),
            SizedBox(
              height: bottomHeight + 25,
            )
          ],
        ),
      ),
    );
  }

  String sumOfItems() {
    return _.itemsToBuy.isNotEmpty
        ? _.itemsToBuy.keys
            .map((product) => product.price * _.itemsToBuy[product]!.value)
            .reduce((value, element) => value + element)
            .toStringAsPrecision(5)
        : '0';
  }
}

Widget productItemCart(
    BuildContext context, CartController _, ProductDump product) {
  return Container(
    width: 350,
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        circularImage(AssetImage(product.imagesUrl[0]), 50),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            regularAppText(product.name, 16),
            thinAppText(product.shopDump.shopName, 14),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: regularAppText('${product.price} mm', 16,
                  color: bisneColorPrimary),
            ),
            countController(context, _, product),
          ],
        ),
      ],
    ),
  );
}

Widget countController(
    BuildContext context, CartController _, ProductDump product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () async {
            if (_.itemsToBuy[product]! == 1.obs) {
              bool result = await showAlertDialog(context);
              if (result) {
                _.removeItem(product);
              }
              return;
            }
            _.removeItem(product);
          },
          icon: const Icon(Icons.remove_circle, size: 15)),
      Obx(() => SizedBox(
          width: 20,
          child: Center(
              child: boldAppText(_.itemsToBuy[product].toString(), 15)))),
      IconButton(
          onPressed: () {
            _.addItem(product, 1);
          },
          icon: const Icon(Icons.add_circle, size: 15))
    ],
  );
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
