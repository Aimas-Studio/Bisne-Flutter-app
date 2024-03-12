import 'package:flutter/material.dart';

import '../widgets_export.dart';

class BisneCard extends StatelessWidget {
  final String name;
  final String image;
  final String rate;
  final String category;
  final double heightCard;
  final double widthCard;
  final double? price;
  final VoidCallback onpressed;

  const BisneCard({
    Key? key,
    required this.name,
    required this.image,
    required this.category,
    required this.heightCard,
    required this.widthCard,
    required this.rate,
    required this.onpressed,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255),
              )
            ]),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoCard(
                widthMedia: widthCard,
                heightMedia: heightCard,
                image: image,
                rate: rate),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(children: [
                const SizedBox(height: 10),
                SizedBox(
                    width: widthCard,
                    child: BoldAppText(
                      text: name,
                      size: 16,
                      color: Colors.black,
                      align: TextAlign.center,
                    )),
                const SizedBox(height: 5),
                SizedBox(
                    width: widthCard,
                    child: RegularAppText(
                      text: category,
                      size: 12,
                      maxLines: 1,
                      align: TextAlign.center,
                    )),
                const SizedBox(height: 5),
                price == null
                    ? Container()
                    : Row(
                        children: [
                          BoldAppText(
                              text: price!.toStringAsPrecision(5), size: 18),
                          const SizedBox(width: 10),
                          const ThinAppText(text: 'mm', size: 18)
                        ],
                      )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
