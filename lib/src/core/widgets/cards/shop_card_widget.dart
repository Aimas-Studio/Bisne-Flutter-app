import 'package:bisne/src/core/widgets/cards/photo_card_widget.dart';
import 'package:bisne/src/core/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';

import '../../../Pages/Shop/shop_page.dart';

class ShopCard extends Card {
  final String name;
  final String description;
  final String image;
  final String rate;

  const ShopCard({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 550 ? 170 : 130;
    double widthMedia = MediaQuery.of(context).size.width > 550 ? 180 : 145;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => ShopPage(),
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
                child:
                    RegularAppText(text: name, size: 16, color: Colors.black)),
            const SizedBox(height: 5),
            SizedBox(
                width: widthMedia,
                child: RegularAppText(text: description, size: 12, maxLines: 1))
          ],
        ));
  }
}
