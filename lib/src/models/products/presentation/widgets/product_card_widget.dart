import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';

class BisneCard extends StatelessWidget {
  final String name;
  final String image;
  final String rate;
  final String description;
  final double heightCard;
  final double widthCard;
  final double? price;
  final VoidCallback onpressed;

  const BisneCard({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.heightCard,
    required this.widthCard,
    required this.rate,
    required this.onpressed,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 550 ? 190 : 155;
    double widthMedia = MediaQuery.of(context).size.width > 550 ? 160 : 145;
    return InkWell(
      onTap: onpressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoCard(
              widthMedia: widthCard,
              heightMedia: heightCard,
              image: image,
              rate: rate),
          const SizedBox(height: 10),
          SizedBox(
              width: widthCard,
              child: RegularAppText(text: name, size: 16, color: Colors.black)),
          const SizedBox(height: 5),
          SizedBox(
              width: widthCard,
              child: RegularAppText(text: description, size: 12, maxLines: 1)),
          const SizedBox(height: 5),
          SizedBox(
            width: widthCard,
          ),
          price == null
              ? Container()
              : Row(
                  children: [
                    BoldAppText(text: price!.toStringAsPrecision(5), size: 18),
                    const SizedBox(width: 10),
                    const ThinAppText(text: 'mm', size: 18)
                  ],
                )
        ],
      ),
    );
  }
}
