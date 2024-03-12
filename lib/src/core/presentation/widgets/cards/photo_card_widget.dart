import 'package:flutter/material.dart';

import '../texts/texts_widgets.dart';
import 'favorite_button_widget.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.widthMedia,
    required this.heightMedia,
    required this.image,
    required this.rate,
  });

  final double widthMedia;
  final double heightMedia;
  final String image;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthMedia,
      height: heightMedia,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Hero(
              tag: 'photo',
              child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/Images/placeholder_baner.png'),
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                  width: widthMedia),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 3, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      RegularAppText(text: rate, size: 16),
                      const Icon(Icons.star_rounded,
                          color: Color.fromRGBO(253, 217, 75, 1), size: 20),
                    ],
                  ),
                ),
                const FavoriteButton(
                  size: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
