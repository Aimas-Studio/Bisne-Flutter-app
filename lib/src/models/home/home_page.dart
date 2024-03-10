import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/presentation/widgets/cards/card_tables.dart';
import '../../core/presentation/widgets/promotions/banner_promotional_widget.dart';
import 'presentations/controllers/home_page_controller.dart';
import 'presentations/widgets/drawer_home_widget.dart';
import 'presentations/widgets/home_page_widgets.dart';

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
          appBar: appbarHomePage(),
          endDrawer: const DrawerHomeWidget(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const BannerSwiper(
                  rounded: false,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                searchRow(),
                const SizedBox(height: 15.0),
                categoryText(),
                const SizedBox(
                  height: 18.0,
                ),
                categoryIcons(mediaViewPort, section),
                sectionName(section),
                const SizedBox(
                  height: 15.0,
                ),
                FutureBuilder(
                  future: controller.fetchShops(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return createShopTable(context, snapshot.data!);
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}