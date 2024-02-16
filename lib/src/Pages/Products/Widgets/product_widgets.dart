import 'package:bisne/src/Pages/Products/product_page_controller.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

Widget productSwiper(BuildContext context, List<ImageProvider> images) {
  return Center(
    child: Container(
        alignment: Alignment.center,
        height: context.width > 400 ? 250 : 150,
        width:
            context.width > 400 ? context.width * 0.70 : context.width * 0.80,
        child: Swiper(
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width > 400 ? 80 : 55),
                child: Image(image: images[index]));
          },
          autoplay: false,
          itemCount: images.length,
          control: const SwiperControl(color: iconAppColor, size: 50.0),
        )),
  );
}
