import 'package:bisne/src/Pages/Products/Widgets/product_widgets.dart';
import 'package:bisne/src/Pages/Products/product_page_controller.dart';
import 'package:bisne/src/Pages/Shop/controllers/shop_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../core/entities/comments_controller/coment_controller.dart';
import '../../core/entities/product.dart';
import '../../core/entities/shop.dart';
import '../../core/presentation/themes/colors.dart';
import '../../core/presentation/widgets/return_button_widget.dart';
import '../../core/presentation/widgets/secondary_app_bar.dart';
import '../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../core/utils/comment_widgets.dart';
import '../Shop/Widgets/shop_page_widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CommentController());
    Get.lazyPut(() => ProductPageController());
    final controller = Get.find<ProductPageController>();
    double mediaWidth = MediaQuery.sizeOf(context).width > 550 ? 100.0 : 80.0;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () async {},
            stretchTriggerOffset: 300.0,
            expandedHeight: 300.0,
            leading: const SizedBox(),
            title: const ReturnButtonAppbar(),
            titleSpacing: -30,
            elevation: 0,
            toolbarHeight: 70,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            actions: const [IconCartWidget(), SizedBox(width: 15)],
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return const Image(
                      image: AssetImage('assets/Images/hero.png'),
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: 3,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          size: 15.0,
                          activeSize: 15.0,
                          color: Color.fromRGBO(223, 224, 223, 1),
                          activeColor: Colors.white),
                      alignment: Alignment.bottomCenter),
                ),
              ),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    InfoWidget(
                        title: controller.name,
                        subtitle: controller.shopName,
                        trailing: RegularAppText(
                          text: '${controller.price} mm',
                          size: 30,
                        ),
                        rate: controller.rate.toString(),
                        description: controller.description)
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Get.lazyPut(() => CommentController());
  //   Get.lazyPut(() => ProductPageController());
  //   return Scaffold(
  //     appBar: secondaryAppBar(context, true,
  //         iconData: Icons.shopping_cart_outlined,
  //         shopPageController: Get.find<ShopPageController>()),
  //     body: ListView(
  //       physics: const BouncingScrollPhysics(),
  //       children: [
  //         productContainer(context, Get.find<ProductPageController>()),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(top: 50.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               FutureBuilder(
  //                 future: ProductsProvider().cargarData(8),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.hasData) {
  //                     return createProductTable(context, snapshot.data!);
  //                   } else {
  //                     return Container();
  //                   }
  //                 },
  //               ),
  // const BannerSwiper(rounded: true)
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //     backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
  //   );
  // }

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

  Widget productInfo(BuildContext context, ProductPageController _) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        RegularAppText(text: _.shopName, size: 32),
        nameAndRate(context, _),
        const SizedBox(
          height: 20,
        ),
        RegularAppText(text: _.description, size: 21, maxLines: 5),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            BoldAppText(text: _.price.toStringAsPrecision(5), size: 35),
            const SizedBox(
              width: 10,
            ),
            const RegularAppText(text: 'mm', size: 30)
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
            child: BoldAppText(text: _.name, size: 40, maxLines: 2)),
        Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(253, 217, 75, 0.11),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 50,
          width: 50,
          child: Center(child: RateWidget(rate: _.rate.toString())),
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
