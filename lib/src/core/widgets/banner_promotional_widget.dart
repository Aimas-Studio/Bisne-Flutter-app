// ignore_for_file: unnecessary_new, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../Pages/Home/Providers/PromotionalProvider.dart';

class BannerPromotionalWidget extends StatelessWidget {
  final List<dynamic> images;
  final bool rounded;

  const BannerPromotionalWidget(
      {super.key, required this.images, required this.rounded});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.sizeOf(context).width > 400 ? 200.0 : 150.0;
    double mediaWidth = MediaQuery.sizeOf(context).width > 400 ? 100.0 : 80.0;

    return Container(
      height: mediaHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: mediaWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ));
        },
        scale: 0.7,
        viewportFraction: MediaQuery.sizeOf(context).width > 400 ? 0.6 : 0.7,
        itemCount: images.length,
        pagination: RectSwiperPaginationBuilder(),
      ),
    );
  }
}

class BannerSwiper extends StatelessWidget {
  final bool rounded;
  const BannerSwiper({super.key, required this.rounded});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PromoProvider.cargarData(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? BannerPromotionalWidget(
                  images: snapshot.data!, rounded: rounded)
              : Container();
        });
  }
}
