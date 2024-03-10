import 'dart:ffi';

import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/buttons/category_button.dart';
import '../../../../core/presentation/widgets/buttons/return_button_widget.dart';
import '../../../../core/presentation/widgets/inputs/search_input_widget.dart';
import '../../../../core/presentation/widgets/promotions/banner_promotional_widget.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../cart/export.dart';
import '../../../home/infrastructure/services/products_provider.dart';
import '../../domain/entities/shop_entity.dart';
import '../controllers/shop_page_controller.dart';
import '../widgets/shop_page_widgets.dart';

class ShopPage extends StatelessWidget {
  final Shop shop;
  const ShopPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopPageController>(
        init: ShopPageController(
            category: shop.category,
            subcategories: shop.subcategories,
            descripcion: shop.description,
            name: shop.name,
            openingHours: shop.openingHours,
            image: shop.imageUrl),
        builder: (shopPageController) {
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
                    background: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          image: DecorationImage(
                              image: NetworkImage(shopPageController.image),
                              fit: BoxFit.cover)),
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
                            title: shopPageController.name,
                            subtitle: Row(
                              children: [
                                BoldAppText(text: shopPageController.category),
                                const SizedBox(
                                  width: 10,
                                ),
                                RegularAppText(
                                    text: shopPageController.localitation)
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 30,
                                  child: Icon(
                                    CustomIcons.eye,
                                    size: 16,
                                    color: iconAppColor,
                                  ),
                                ),
                                SizedBox(
                                    height: 25,
                                    width: 40,
                                    child: Center(
                                        child: ThinAppText(
                                            text: shopPageController
                                                        .viewsCount >
                                                    999
                                                ? '${(shopPageController.viewsCount / 1000).toString()} K'
                                                : shopPageController.viewsCount
                                                    .toString(),
                                            size: 20))),
                              ],
                            ),
                            rate: shopPageController.rate.toString(),
                            description: shopPageController.descripcion,
                          ),
                          // isInfoPage ? moreInfoPage(context, _) :
                          const TextButtonShowMoreInfo(),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchInput(
                              searchController: SearchController(),
                              hintText: 'Buscar en esta tienda...'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CategorySection(
                              categories: shopPageController.subcategories,
                              controller: shopPageController,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder(
                                  stream: shopPageController.indexStream,
                                  builder: (context, snapshot) {
                                    return FutureBuilder(
                                        key: UniqueKey(),
                                        future:
                                            ProductsProvider().cargarData(8),
                                        builder: (context, snapshot) => snapshot
                                                .hasData
                                            ? Container()
                                            // createProductTable(
                                            // context, snapshot.data!)
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator()));
                                  }),
                              const BannerSwiper(rounded: true)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
          ;
        });
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.categories,
    required this.controller,
  });

  final List<String> categories;
  final IndexButtonController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categoriesButton(categories, controller)[index];
        },
      ),
    );
  }

  List<Widget> categoriesButton(
      List<String> categories, IndexButtonController controller) {
    List<Widget> buttons = [];
    for (int i = 0; i < categories.length; i++) {
      buttons.add(
        i == 0
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Obx(() => CategoryButton(
                    onPressed: () {
                      controller.indexButton.value = i;
                    },
                    label: categories[i],
                    isPressed: controller.indexButton.value == i)),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => CategoryButton(
                    onPressed: () {
                      controller.indexButton.value = i;
                    },
                    label: categories[i],
                    isPressed: controller.indexButton.value == i)),
              ),
      );
    }
    return buttons;
  }
}
