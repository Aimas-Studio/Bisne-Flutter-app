import 'package:bisne/src/Pages/Products/product_page.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends Card {
  final String name;
  final String image;
  final int price;

  const ProductCard({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 400 ? 260 : 250;
    double widthMedia = MediaQuery.of(context).size.width > 400 ? 165 : 145;
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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3.0)]),
        clipBehavior: Clip.antiAlias,
        height: heightMedia,
        width: widthMedia,
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: widthMedia,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      regularAppText(name, context.width > 400 ? 18 : 16,
                          maxLines: 2),
                      Row(
                        children: [
                          boldAppText(price.toStringAsPrecision(5), 18),
                          const SizedBox(width: 10),
                          thinAppText('mm', 18)
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
