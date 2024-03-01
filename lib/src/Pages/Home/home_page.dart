import 'package:bisne/src/Pages/Home/Widgets/drawer_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/banner_promotional_widget.dart';
import 'Widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  final String section = 'Populares';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaViewPort = context.width > 550 ? 0.14 : 0.25;
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
            sectionShops(context),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
