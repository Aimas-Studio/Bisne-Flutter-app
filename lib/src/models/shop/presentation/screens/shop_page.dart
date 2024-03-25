import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/buttons/categories_row.dart';
import 'package:bisne/src/core/presentation/widgets/widgets_export.dart';
import 'package:bisne/src/core/utils/search_row_widget.dart';
import 'package:bisne/src/models/cart/export.dart';
import 'package:bisne/src/models/home/test/Shops.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/init/init_app.dart';
import '../../domain/entities/shop_entity.dart';
import '../controllers/shop_page_controller.dart';
import '../widgets/shop_page_widgets.dart';

class ShopPage extends StatefulWidget {
  final Shop shop;
  ShopPage({super.key, required this.shop});

  @override
  _ShopPageState createState() => _ShopPageState(shop: shop);
}

class _ShopPageState extends State<ShopPage> {
  final Shop shop;
  _ShopPageState({required this.shop});
  final PageController _controller = PageController();
  double topPosition = 1.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        topPosition = 1 - _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = MyScrollController(pageController: _controller);
    return GetBuilder<ShopPageController>(
      init: ShopPageController(shop: shop),
      builder: (shopPageController) {
        return Scaffold(
          appBar: AppBar(
            leading: const ReturnButtonAppbar(),
            title: topPosition > 0.1
                ? const SizedBox()
                : Row(
                    children: [
                      CircularImage(
                          size: 25,
                          shadow: false,
                          child: Image(image: NetworkImage(shop.imageUrl))),
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
                                text: shop.name,
                                size: 20,
                                color: fontAppColor,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RegularAppText(
                                text: shop.category,
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
              topPosition > 0.1
                  ? const FavoriteButton(size: 1.2)
                  : const IconCartWidget(),
              const SizedBox(
                width: 25,
              )
            ],
            forceMaterialTransparency: true,
            elevation: 0,
            backgroundColor: topPosition < 0.7
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: PageView(
            pageSnapping: true,
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: NetworkImage(shop.imageUrl),
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
                        children: [
                          InfoWidget(
                            title: shop.name,
                            subtitle: RegularAppText(
                                text:
                                    "${shop.category} / ${shopPageController.localitation}"),
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
                                                : shopPageController.viewsCount
                                                    .toString(),
                                            size: 20))),
                              ],
                            ),
                            rate: shopPageController.rate,
                            description: shop.description,
                          ),
                          TextButtonShowMoreInfo(shop: shop),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, fontAppColor2],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 80, width: 50),
                      SearchRow(
                        icon: const Icon(
                          Icons.share_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                        color: bisneColorPrimary,
                        onPressed: () => {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CategoriesRow(
                          labels: shopPageController.shop.subcategories,
                          controller: shopPageController,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification notification) {
                              if (notification is OverscrollNotification &&
                                  notification.overscroll < 0.0) {
                                _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }
                              return false;
                            },
                            child: SingleChildScrollView(
                                controller: scrollcontroller,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TableCardWidget(
                                    maxColumns:
                                        MediaQuery.sizeOf(context).width > 550
                                            ? 3
                                            : 2,
                                    data: products,
                                  ),
                                )
                                // StreamBuilder(
                                //   stream: shopPageController.indexStream,
                                //   builder: (context, snapshot) {
                                //     return FutureBuilder(
                                //       key: UniqueKey(),
                                //       future: ProductsProvider().cargarData(8),
                                //       builder: (context, snapshot) => snapshot
                                //               .hasData
                                //           ? Container()
                                //           // createProductTable(
                                //           // context, snapshot.data!)
                                //           : const Center(
                                //               child: CircularProgressIndicator()),
                                //     );
                                //   },
                                // ),

                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyScrollController extends ScrollController {
  final PageController pageController;

  MyScrollController({required this.pageController});

  @override
  void jumpTo(double value) {
    if (positions.isEmpty) {
      pageController.jumpTo(value);
    } else {
      super.jumpTo(value);
    }
  }

  @override
  Future<void> animateTo(double value,
      {required Duration duration, required Curve curve}) async {
    if (positions.isEmpty) {
      await pageController.animateTo(value, duration: duration, curve: curve);
    } else {
      await super.animateTo(value, duration: duration, curve: curve);
    }
  }
}
