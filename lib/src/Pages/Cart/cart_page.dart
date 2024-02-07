import 'package:bisne/src/Pages/Cart/cart_page_controller.dart';
import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartController _ = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar(context, true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: productsItems(context, _)..add(requiredInfo()),
        ),
      ),
    );
  }

  List<Widget> productsItems(BuildContext context, CartController _) {
    return _.itemsToBuy.keys.map((product) {
      return productItemCart(context, _, product);
    }).toList();
  }

  Widget requiredInfo() {
    return Column(
      children: [boldAppText('Datos requerido', 30)],
    );
  }
}

Widget productItemCart(
    BuildContext context, CartController _, ProductDump product) {
  return Container(
    width: 350,
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        circularImage(AssetImage(product.imageUrl), 50),
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
            countController(_, product),
            SizedBox.expand(),
          ],
        ),
      ],
    ),
  );
}

Widget countController(CartController _, ProductDump product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
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
