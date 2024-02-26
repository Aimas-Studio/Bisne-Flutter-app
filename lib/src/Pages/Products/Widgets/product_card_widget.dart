import 'package:bisne/src/Pages/Products/product_page.dart';
import 'package:bisne/src/core/widgets/cards/photo_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/Utils/texts.dart';

class ProductCard extends Card {
  final String name;
  final String image;
  final int price;
  final String rate = '4.5';
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  const ProductCard({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 400 ? 190 : 155;
    double widthMedia = MediaQuery.of(context).size.width > 400 ? 160 : 145;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const ProductPage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoCard(
              widthMedia: widthMedia,
              heightMedia: heightMedia,
              image: image,
              rate: rate),
          const SizedBox(height: 10),
          SizedBox(
              width: widthMedia,
              child: regularAppText(name, 16, color: Colors.black)),
          const SizedBox(height: 5),
          SizedBox(
              width: widthMedia,
              child: regularAppText(description, 12, maxLines: 1)),
          const SizedBox(height: 5),
          SizedBox(
              width: widthMedia,
              child: regularAppText('${price.toStringAsPrecision(5)} mm', 18,
                  maxLines: 1))
        ],
      ),
    );
  }
}
