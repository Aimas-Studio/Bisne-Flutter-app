import 'package:bisne/src/Pages/Products/product_page_controller.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

Widget productSwiper(BuildContext context, ProductPageController _) {
  return Center(
    child: Container(
        alignment: Alignment.center,
        height: 250,
        width: context.width * 0.70,
        child: Swiper(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Image.asset(
                _.images[index],
                fit: BoxFit.fill,
              ),
            );
          },
          autoplay: false,
          itemCount: _.images.length,
          control: const SwiperControl(color: iconAppColor, size: 50.0),
        )),
  );
}
