import 'dart:async';
import 'dart:ffi';

import 'package:bisne/src/Pages/Home/Providers/ProductsProvider.dart';
import 'package:bisne/src/Pages/Shop/Widgets/shop_page_widgets.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:bisne/src/core/widgets/CategoryButton.dart';
import 'package:bisne/src/core/widgets/banner_promotional_widget.dart';
import 'package:bisne/src/core/widgets/cards/card_tables.dart';
import 'package:bisne/src/core/widgets/return_button_widget.dart';
import 'package:bisne/src/core/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../core/widgets/secondary_app_bar.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  final ShopPageController _shopPageController = Get.put(ShopPageController());

  @override
  Widget build(BuildContext context) {
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    image: DecorationImage(
                      image: AssetImage('assets/Images/hero.png'),
                      fit: BoxFit.cover,
                    )),
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
                    info(_shopPageController, context, false),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchInput(
                        searchController: SearchController(),
                        hintText: 'Buscar en esta tienda...'),
                    CategorySection(
                      categories: _shopPageController.categories,
                      controller: _shopPageController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder(
                              stream: _shopPageController.indexStream,
                              builder: (context, snapshot) {
                                return FutureBuilder(
                                    key: UniqueKey(),
                                    future: ProductsProvider().cargarData(8),
                                    builder: (context, snapshot) => snapshot
                                            .hasData
                                        ? createProductTable(
                                            context, snapshot.data!)
                                        : const Center(
                                            child:
                                                CircularProgressIndicator()));
                              }),
                          const BannerSwiper(rounded: true)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Obx(() => PageView(
          padEnds: false,
          controller: PageController(viewportFraction: 0.2),
          scrollDirection: Axis.horizontal,
          children: categoriesButton(categories, controller))),
    );
  }

  List<Widget> categoriesButton(
      List<String> categories, IndexButtonController controller) {
    List<Widget> buttons = [];
    for (int i = 0; i < categories.length; i++) {
      buttons.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoryButton(
              onPressed: () {
                controller.indexButton.value = i;
              },
              label: categories[i],
              isPressed: controller.indexButton.value == i)));
    }
    return buttons;
  }
}
