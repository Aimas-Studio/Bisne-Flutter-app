import 'package:bisne/src/Pages/Products/Widgets/product_widgets.dart';
import 'package:bisne/src/Pages/Products/product_page_controller.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/Utils/Entities/comments_controller/coment_controller.dart';
import '../../core/Utils/Entities/product.dart';
import '../../core/Utils/Entities/shop.dart';
import '../../core/Utils/comments.dart';
import '../../core/Utils/interfaces.dart';
import '../../core/Utils/texts.dart';
import '../../core/widgets/secondary_app_bar.dart';
import '../Shop/Widgets/shop_page_widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CommentController());
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
          productSwiper(
              context, _.images.map((image) => AssetImage(image)).toList()),
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
        regularAppText(_.description, 21, maxLines: 5),
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
        SizedBox(
            width: context.width * 0.7,
            child: boldAppText(_.name, 40, maxLines: 2)),
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
        Expanded(
            flex: context.width > 400 ? 1 : 3,
            child: saveButton(context, productPageController)),
        SizedBox(
          width: context.width > 400 ? 20 : 10,
        ),
        Expanded(
            flex: context.width > 400 ? 1 : 4,
            child: buyButton(context, productPageController))
      ],
    );
  }

  Widget saveButton(BuildContext context, ProductPageController _) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: 18, horizontal: context.width > 400 ? 40 : 0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(69, 77, 90, 1))),
        onPressed: () => {},
        child: regularAppText('GUARDAR', context.width > 400 ? 30 : 20,
            color: Colors.white));
  }

  Widget buyButton(BuildContext context, ProductPageController _) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(top: 15, bottom: 15, right: 10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(bisneColorPrimary)),
        onPressed: () {
          ProductDump newProduct = ProductDump(
            _.name,
            _.price,
            _.images,
            _.description,
            ShopDump(_.shopName, _.shopImage),
            "category",
          );
          final shop = Get.find<ShopPageController>();
          if (isInCart(shop.cart, newProduct)) {
            addToCart(shop.cart, newProduct, _.count);
          } else {
            shop.cart[newProduct] = 1.obs;
            shop.cart[newProduct]!.value = _.count as int;
          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: regularAppText(
                      'COMPRAR', context.width > 400 ? 30 : 20,
                      color: Colors.white),
                ),
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(Icons.arrow_forward_ios_rounded,
                      color: iconAppColor, size: 30))
            ],
          ),
        ));
  }

  bool isInCart(Map<dynamic, dynamic> cart, ProductDump newProduct) {
    for (ProductDump product in cart.keys) {
      if (product.name == newProduct.name &&
          product.price == newProduct.price &&
          product.description == newProduct.description &&
          product.shopDump.shopName == newProduct.shopDump.shopName) {
        return true;
      }
    }
    return false;
  }

  void addToCart(
      Map<dynamic, dynamic> cart, ProductDump newProduct, int count) {
    for (ProductDump product in cart.keys) {
      if (product.name == newProduct.name &&
          product.price == newProduct.price &&
          product.description == newProduct.description &&
          product.shopDump.shopName == newProduct.shopDump.shopName) {
        cart[product]!.value += count;
      }
    }
  }
}
