import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../../core/Utils/interfaces.dart';
import '../../../core/widgets/rectangle_circular_image.dart';

Widget productSwiper(BuildContext context, List<ImageProvider> images) {
  Swiper swiper = Swiper(
    layout: SwiperLayout.DEFAULT,
    itemBuilder: (context, index) {
      return rectangleCircularImage(images[index], 80);
    },
    autoplay: false,
    itemCount: images.length,
    control: const SwiperControl(color: iconAppColor, size: 50.0),
  );

  Widget swiperHolder = SizedBox.expand(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(23)),
        border: Border.all(
          width: 0.5,
          color: borderColor,
        ),
      ),
      child: const Icon(
        Icons.add_photo_alternate_outlined,
        color: fontAppColor,
      ),
    ),
  );

  return Center(
    child: Container(
      alignment: Alignment.center,
      height: context.width > 400 ? 250 : 150,
      width: context.width > 400 ? context.width * 0.70 : context.width * 0.80,
      child: Padding(
        padding: EdgeInsets.zero,
        child: images.isEmpty ? swiperHolder : swiper,
      ),
    ),
  );
}
