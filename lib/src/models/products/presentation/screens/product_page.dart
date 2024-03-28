import 'package:bisne/src/core/presentation/widgets/buttons/main_button_widget.dart';
import 'package:bisne/src/core/presentation/widgets/buttons/secundary_button_widget.dart';
import 'package:bisne/src/core/presentation/widgets/cards/bisne_card_wiget.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../cart/export.dart';
import '../../../shop/presentation/widgets/shop_page_widgets.dart';
import '../../domain/entities/product_entity.dart';
import '../controllers/product_page_controller.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(
      init: ProductPageController(product: product),
      id: ProductPageController.id,
      builder: (productPageController) {
        return Scaffold(
          appBar: AppBar(
            leading: const ReturnButtonAppbar(),
            title: productPageController.topPosition > 0.1
                ? const SizedBox()
                : Row(
                    children: [
                      CircularImage(
                          size: 25,
                          shadow: false,
                          child: Image(
                              image: customNetworkImage(
                                  productPageController.product.imageUrl))),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: RegularAppText(
                                text: productPageController.product.name,
                                size: 20,
                                color: fontAppColor,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RegularAppText(
                                text:
                                    productPageController.product.shop.category,
                                size: 18,
                                color: fontAppColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
            actions: [
              productPageController.topPosition > 0.1
                  ? FavoriteButton(
                      size: 1.2,
                      isFavorite: productPageController.product.isFavorite,
                      isShop: false,
                      id: productPageController.product.id,
                    )
                  : const IconCartWidget(),
              const SizedBox(
                width: 25,
              )
            ],
            forceMaterialTransparency: true,
            elevation: 0,
            backgroundColor: productPageController.topPosition < 0.7
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: PageView(
            pageSnapping: true,
            controller: PageController(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: customNetworkImage(
                                productPageController.product.imageUrl),
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: fontAppColor2),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(color: fontAppColor2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InfoWidget(
                            title: productPageController.product.name,
                            subtitle: RegularAppText(
                                text:
                                    "${productPageController.product.shop.name}, ${productPageController.product.shop.category}"),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 25,
                                    width: 110,
                                    child: Center(
                                        child: BoldAppText(
                                      text:
                                          '${productPageController.product.price} mm',
                                      size: 22,
                                      color: bisneColorPrimary,
                                    ))),
                              ],
                            ),
                            rate: productPageController.product.rate,
                            description:
                                productPageController.product.description,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 70,
                                  child: MainButton(
                                    text: const BoldAppText(
                                      text: 'Añadir al carrito',
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: BuyWindow(
                                                controller:
                                                    productPageController),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 12,
                                  child: Center(
                                    child: Container(
                                      height: 43,
                                      width: 43,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: IconButton(
                                          onPressed: () => (),
                                          icon: const Icon(
                                            Icons.message,
                                            color: iconAppColor,
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Center(
                                    child: Container(
                                      height: 43,
                                      width: 43,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: IconButton(
                                          onPressed: () => (),
                                          icon: const Icon(
                                            Icons.share,
                                            color: iconAppColor,
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, fontAppColor2],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
            child: Center(
                child: BoldAppText(text: _.count.toString(), size: 40)))),
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
            flex: context.width > 550 ? 1 : 3,
            child: saveButton(context, productPageController)),
        SizedBox(
          width: context.width > 550 ? 20 : 10,
        ),
        Expanded(
            flex: context.width > 550 ? 1 : 4,
            child: buyButton(context, productPageController))
      ],
    );
  }

  Widget saveButton(BuildContext context, ProductPageController _) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: 18, horizontal: context.width > 550 ? 40 : 0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(69, 77, 90, 1))),
        onPressed: () => {},
        child: RegularAppText(
            text: 'GUARDAR',
            size: context.width > 550 ? 30 : 20,
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
          // Product newProduct = Product(
          //   _.name,
          //   _.price,
          //   _.images,
          //   _.description,
          //   Shop(name: _.name, imageUrl: _.shopImage, description: '', id: 4),
          //   "category",
          // );
          // final shop = Get.find<productPageController>();
          // if (isInCart(shop.cart, newProduct)) {
          //   addToCart(shop.cart, newProduct, _.count);
          // } else {
          //   // shop.cart[newProduct] = 1.obs;
          //   // shop.cart[newProduct]!.value = _.count as int;
          // }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: RegularAppText(
                      text: 'COMPRAR',
                      size: context.width > 550 ? 30 : 20,
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
}

class BuyWindow extends StatelessWidget {
  final ProductPageController controller;
  const BuyWindow({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    controller.count = 0;
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 150,
            child: BisneCard(
              name: BoldAppText(
                  text: controller.product.name,
                  size: 16,
                  color: Colors.black,
                  align: TextAlign.start),
              category: RegularAppText(
                  text: controller.product.shop.category,
                  size: 12,
                  maxLines: 1,
                  align: TextAlign.start),
              image: controller.product.imageUrl,
              rate: controller.product.rate,
              heightCard: 150,
              widthCard: 150,
              onpressed: () {},
              price: controller.product.price,
              isFavorite: true,
              id: controller.product.id,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const BoldAppText(
            text: "Añadir al carrito",
            color: Colors.black,
          ),
          const RegularAppText(
            text: 'Seleccione la cantidad de productos que desea añadir',
            size: 20,
            maxLines: 5,
            align: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(199, 198, 198, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                    onPressed: () => (controller.removeItem()),
                    icon: const Icon(
                      Icons.remove,
                      color: iconAppColor,
                      size: 15,
                    )),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                        width: 30,
                        child: BoldAppText(
                          text: controller.count.toString(),
                          align: TextAlign.center,
                        )),
                  )),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(199, 198, 198, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                    onPressed: () => (controller.addItem()),
                    icon: const Icon(
                      Icons.add,
                      color: iconAppColor,
                      size: 15,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 270,
            child: MainButton(
              text: const RegularAppText(
                text: 'Añadir al carrito',
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                controller.addToCart();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
