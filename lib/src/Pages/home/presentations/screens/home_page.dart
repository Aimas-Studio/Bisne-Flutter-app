import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/banner_promotional_widget.dart';
import '../../../shop/export.dart';
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
          appBar: appbarHomePage(),
          endDrawer: const DrawerHomeWidget(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: FutureBuilder<List<Shop?>>(
                    future: controller.fetchShops(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final shops = snapshot.data!;
                        return Text(shops[0]!.shopName);
                      } else if (snapshot.hasError) {
                        return Text('Error');
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
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
                sectionShops(context),
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
