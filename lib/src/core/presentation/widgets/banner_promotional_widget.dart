import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../../Pages/Home/infrastructure/services/promotional_provider.dart';

class BannerPromotionalWidget extends StatelessWidget {
  final List<dynamic> images;
  final bool rounded;

  const BannerPromotionalWidget(
      {super.key, required this.images, required this.rounded});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.sizeOf(context).width > 550 ? 200.0 : 150.0;
    double mediaWidth = MediaQuery.sizeOf(context).width > 550 ? 100.0 : 80.0;

    return SizedBox(
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
        viewportFraction: MediaQuery.sizeOf(context).width > 550 ? 0.6 : 0.7,
        itemCount: images.length,
        pagination: const RectSwiperPaginationBuilder(),
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
