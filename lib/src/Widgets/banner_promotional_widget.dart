// ignore_for_file: unnecessary_new, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../Pages/Home/Providers/PromotionalProvider.dart';

class BannerPromotionalWidget extends StatelessWidget {
  final List<dynamic> images;
  final bool rounded;

  const BannerPromotionalWidget(
      {super.key, required this.images, required this.rounded});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.sizeOf(context).width > 400 ? 260.0 : 250.0;
    return Center(
      child: Container(
          height: mediaHeight,
          width: rounded ? context.width * 0.9 : context.width,
          child: Swiper(
              layout: SwiperLayout.DEFAULT,
              containerHeight: 50,
              autoplayDisableOnInteraction: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 33.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: rounded
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(0),
                          color: Color.fromRGBO(0, 105, 126, 1)),
                      child: FadeInImage(
                          placeholder: AssetImage('assets/Images/hero.png'),
                          image: AssetImage(images[index])),
                    ));
              },
              autoplay: false,
              autoplayDelay: 6000,
              itemCount: images.length,
              pagination: new SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey[350],
                    activeColor: Colors.green[400],
                    size: 10.0,
                    space: 2,
                  )))),
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
