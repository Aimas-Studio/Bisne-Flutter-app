import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/cards/favorite_button_widget.dart';
import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:bisne/src/core/utils/search_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/buttons/category_button.dart';
import '../../../../core/presentation/widgets/buttons/return_button_widget.dart';
import '../../../../core/presentation/widgets/promotions/banner_promotional_widget.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
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
                  backgroundColor: Colors.white,
                  actions: const [
                    FavoriteButton(size: 1.2),
                    SizedBox(width: 15)
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                      height: 300,
                      child: Hero(
                        tag: 'photo',
                        child: Image(
                          image: NetworkImage(shopPageController.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          children: [
                            InfoWidget(
                              title: shopPageController.name,
                              subtitle: RegularAppText(
                                  text:
                                      "${shopPageController.category} / ${shopPageController.localitation}"),
                              trailing: Row(
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
                                      width: 50,
                                      child: Center(
                                          child: RegularAppText(
                                              text: shopPageController
                                                          .viewsCount >
                                                      999
                                                  ? '${(shopPageController.viewsCount / 1000).toString()} K'
                                                  : shopPageController
                                                      .viewsCount
                                                      .toString(),
                                              size: 20))),
                                ],
                              ),
                              rate: shopPageController.rate,
                              description: shopPageController.descripcion,
                            ),
                            // isInfoPage ? moreInfoPage(context, _) :
                            const TextButtonShowMoreInfo(),
                            const SizedBox(
                              height: 20,
                            ),
                            const SearchRow(
                              icon: Icon(
                                Icons.share_sharp,
                                color: Colors.white,
                                size: 35,
                              ),
                              color: bisneColorPrimary,
                            ),
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
                              ],
                            ),
                          ],
                        ),
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
                child: Obx(
                  () => CategoryButton(
                    onPressed: () {
                      controller.indexButton.value = i;
                    },
                    label: categories[i],
                    isPressed: controller.indexButton.value == i,
                    maincolor: iconAppColor,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => CategoryButton(
                      onPressed: () {
                        controller.indexButton.value = i;
                      },
                      label: categories[i],
                      isPressed: controller.indexButton.value == i,
                      maincolor: iconAppColor),
                ),
              ),
      );
    }
    return buttons;
  }
}
