import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/cards/table_card_widget.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:bisne/src/models/home/test/shops.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/init/init_app.dart';
import '../../../../core/presentation/widgets/promotions/banner_promotional_widget.dart';
import '../../../../core/utils/search_row_widget.dart';
import '../../infrastructure/services/category_provider.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/drawer_home_widget.dart';
import '../widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  final String section = 'Populares';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaViewPort = context.width > 550 ? 0.14 : 0.25;
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      id: HomePageController.idController,
      builder: (controller) {
        return Scaffold(
          appBar: HomePageAppBar(),
          backgroundColor: fontAppColor2,
          endDrawer: const DrawerHomeWidget(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const BannerSwiper(
                  rounded: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),

                      const SizedBox(height: 15.0),
                      //Category Text
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const BoldAppText(
                          text: 'Explora y haz tu bisne',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      //Category Icons
                      FutureBuilder(
                        future: CategoryProvider.cargarData(),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>> snapshot) {
                          return SizedBox(
                            height: 125,
                            child: PageView(
                              padEnds: false,
                              controller: PageController(
                                  viewportFraction: mediaViewPort),
                              scrollDirection: Axis.horizontal,
                              children: _setCategories(
                                  snapshot.hasData ? snapshot.data! : [],
                                  section),
                            ),
                          );
                        },
                      ),
                      SearchRow(
                          icon: const Icon(
                            Icons.filter_alt_outlined,
                            color: iconAppColor,
                            size: 35,
                          ),
                          onPressed: () => {}),

                      const SizedBox(
                        height: 18.0,
                      ),
                      sectionName(section),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //debug
                      DEBUG
                          ? TableCardWidget(
                              maxColumns: MediaQuery.sizeOf(context).width > 550
                                  ? 3
                                  : 2,
                              data: shops,
                            )
                          : FutureBuilder(
                              future: controller.fetchShops(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return TableCardWidget(
                                    maxColumns:
                                        MediaQuery.sizeOf(context).width > 550
                                            ? 3
                                            : 2,
                                    data: snapshot.data!,
                                  );
                                } else {
                                  return
                                      // Container();
                                      Table(
                                    children: const [
                                      TableRow(children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/Images/placeholder_baner.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/Images/placeholder_baner.png'))
                                      ]),
                                      TableRow(children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/Images/placeholder_baner.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/Images/placeholder_baner.png'))
                                      ])
                                    ],
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _setCategories(List<dynamic> categories, String section) {
    return categories.map((category) {
      return InkWell(
        onTap: () {
          section = category["name"];
        },
        child: Column(
          children: [
            SvgPicture.asset(category["icon"], height: 75),
            Center(
                child: Text(
              category["name"],
              textAlign: TextAlign.center,
            ))
          ],
        ),
      );
    }).toList();
  }
}
