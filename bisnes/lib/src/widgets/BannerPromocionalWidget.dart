// ignore_for_file: unnecessary_new, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../providers/PromotionalProvider.dart';

class BannerPromotionalWidget extends StatelessWidget {
  List<dynamic> images = [];

  BannerPromotionalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.sizeOf(context).width > 400 ? 220.0 : 250.0;
    return FutureBuilder(
        future: PromoProvider.cargarData(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          images = snapshot.hasData ? snapshot.data! : [];

          return Container(
              height: mediaHeight,
              child: Swiper(
                  layout: SwiperLayout.DEFAULT,
                  containerHeight: 50,
                  autoplayDisableOnInteraction: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 33.0),
                      child: FadeInImage(
                          placeholder: AssetImage('assets/fotos/hero.png'),
                          image: AssetImage(
                            images[index],
                          )),
                    );
                  },
                  autoplay: false,
                  controller: SwiperController(),
                  autoplayDelay: 6000,
                  itemCount: images.length,
                  pagination: new SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: new DotSwiperPaginationBuilder(
                        color: Colors.grey[350],
                        activeColor: Colors.green[400],
                        size: 10.0,
                        space: 2,
                      ))));
        });
  }
}
