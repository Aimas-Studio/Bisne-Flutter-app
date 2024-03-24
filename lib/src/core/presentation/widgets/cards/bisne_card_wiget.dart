import 'package:flutter/material.dart';

import '../widgets_export.dart';

class BisneCard extends StatelessWidget {
  final Widget name;
  final String image;
  final String rate;
  final Widget category;
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
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(190, 192, 199, 1),
                blurRadius: 8,
              )
            ]),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: PhotoCard(
                  widthMedia: widthCard,
                  heightMedia: heightCard,
                  image: image,
                  rate: rate),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        SizedBox(width: widthCard, child: name),
                        SizedBox(width: widthCard, child: category),
                        price == null
                            ? Container()
                            : Expanded(
                                child: Row(
                                  children: [
                                    BoldAppText(
                                        text: price!.toStringAsPrecision(5),
                                        size: 18),
                                    const SizedBox(width: 10),
                                    const BoldAppText(text: 'mm', size: 18)
                                  ],
                                ),
                              )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
