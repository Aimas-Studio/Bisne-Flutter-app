import 'package:bisne/src/Pages/Products/product_page.dart';
import 'package:bisne/src/core/widgets/cards/photo_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/texts/texts_widgets.dart';

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
              child: RegularAppText(text: name, size: 16, color: Colors.black)),
          const SizedBox(height: 5),
          SizedBox(
              width: widthMedia,
              child: RegularAppText(text: description, size: 12, maxLines: 1)),
          const SizedBox(height: 5),
          SizedBox(
            width: widthMedia,
          ),
          Row(
            children: [
              BoldAppText(text: price.toStringAsPrecision(5), size: 18),
              const SizedBox(width: 10),
              const ThinAppText(text: 'mm', size: 18)
            ],
          )
        ],
      ),
    );
  }
}
