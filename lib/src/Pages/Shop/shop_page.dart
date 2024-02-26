import 'package:bisne/src/Pages/Shop/Widgets/shop_page_widgets.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/core/widgets/CategoryButton.dart';
import 'package:bisne/src/core/widgets/return_button_widget.dart';
import 'package:bisne/src/core/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
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
            title: returnButtonWidget(context),
            titleSpacing: -30,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            actions: [
              badge(context, Icons.shopping_cart_outlined, _shopPageController),
              const SizedBox(width: 10)
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: Colors.amber,
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
                    ),
                    setCategories(context, _shopPageController)
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
  });
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: PageView(
        children: categories
            .map((category) => CategoryButton(
                onPressed: () {}, label: 'label', isPressed: true))
            .toList(),
      ),
    );
  }
}
