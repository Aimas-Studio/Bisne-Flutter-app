import 'package:bisne/src/Pages/Products/Widgets/product_widgets.dart';
import 'package:bisne/src/Pages/Products/product_page_controller.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Utils/comments.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Shop/Widgets/shop_page_widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductPageController());
    return Scaffold(
      appBar: secondaryAppBar(context, true,
          iconData: Icons.shopping_cart_outlined,
          shopPageController: Get.find<ShopPageController>()),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          productContainer(context, Get.find<ProductPageController>()),
          const SizedBox(
            height: 20,
          ),
          othersProducts(context, Get.find<ShopPageController>())
        ],
      ),
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    );
  }

  Widget productContainer(BuildContext context, ProductPageController _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(50), right: Radius.circular(50))),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          productSwiper(context, _),
          productInfo(context, _)
        ],
      ),
    );
  }

  Widget othersProducts(context, _) {
    return setCategories(context, _);
  }

  Widget productInfo(BuildContext context, ProductPageController _) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        regularAppText(_.shopName, 32),
        nameAndRate(context, _),
        const SizedBox(
          height: 20,
        ),
        regularAppText(_.description, 21),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            boldAppText(_.price.toStringAsPrecision(5), 35),
            const SizedBox(
              width: 10,
            ),
            regularAppText('mm', 30)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        countController(context, _),
        const SizedBox(
          height: 20,
        ),
        saveAndBuyButtons(context, _),
        const SizedBox(
          height: 20,
        ),
        comments(context, _),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Row nameAndRate(BuildContext context, ProductPageController _) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: context.width * 0.7, child: boldAppText(_.name, 40)),
        Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(253, 217, 75, 0.11),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 50,
          width: 50,
          child: Center(child: iconStar(_)),
        )
      ],
    );
  }

  Widget countController(BuildContext context, ProductPageController _) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              _.count > 1 ? _.count-- : _.count = 1;
            },
            icon: const Icon(Icons.remove_circle, size: 40)),
        Obx(() => SizedBox(
            width: 50,
            child: Center(child: boldAppText(_.count.toString(), 40)))),
        IconButton(
            onPressed: () {
              _.count++;
            },
            icon: const Icon(Icons.add_circle, size: 40))
      ],
    );
  }

  Widget saveAndBuyButtons(
      BuildContext context, ProductPageController productPageController) {
    return Row(
      children: [
        Expanded(flex: context.width > 400 ? 1 : 3, child: saveButton(context)),
        SizedBox(
          width: context.width > 400 ? 20 : 10,
        ),
        Expanded(flex: context.width > 400 ? 1 : 4, child: buyButton(context))
      ],
    );
  }

  Widget saveButton(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: 15, horizontal: context.width > 400 ? 40 : 0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(69, 77, 90, 1))),
        onPressed: () => {},
        child: regularAppText('GUARDAR', context.width > 400 ? 30 : 20,
            color: Colors.white));
  }

  Widget buyButton(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(bisneColorPrimary)),
        onPressed: () => {},
        child: Center(
          child: Row(
            children: [
              regularAppText('COMPRAR', context.width > 400 ? 30 : 20,
                  color: Colors.white),
              const SizedBox(
                width: 20,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.arrow_forward_ios_rounded,
                      color: iconAppColor, size: 30))
            ],
          ),
        ));
  }
}
