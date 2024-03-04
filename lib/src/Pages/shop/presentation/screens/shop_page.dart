import 'package:bisne/src/Pages/Home/Providers/ProductsProvider.dart';
import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/utils/interfaces_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/banner_promotional_widget.dart';
import '../../../../core/presentation/widgets/cards/card_tables.dart';
import '../../../../core/presentation/widgets/category_button.dart';
import '../../../../core/presentation/widgets/return_button_widget.dart';
import '../../../../core/presentation/widgets/search_input_widget.dart';
import '../../../../core/presentation/widgets/secondary_app_bar.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../controllers/shop_page_controller.dart';
import '../widgets/shop_page_widgets.dart';

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
                    InfoWidget(
                      title: _shopPageController.name,
                      subtitle: _shopPageController.categories[0],
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
                                      text: _shopPageController.viewsCount > 999
                                          ? '${(_shopPageController.viewsCount / 1000).toString()} K'
                                          : _shopPageController.viewsCount
                                              .toString(),
                                      size: 20))),
                        ],
                      ),
                      rate: _shopPageController.rate.toString(),
                      description: _shopPageController.descripcion,
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
                        categories: _shopPageController.categories,
                        controller: _shopPageController,
                      ),
                    ),
                    Column(
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
                                          child: CircularProgressIndicator()));
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
      height: 60,
      child: Obx(() => PageView(
          padEnds: false,
          controller: PageController(viewportFraction: 0.25),
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
