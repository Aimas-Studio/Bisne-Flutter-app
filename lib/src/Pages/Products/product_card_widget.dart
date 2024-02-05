import 'package:bisne/src/Pages/Products/product_page.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

class ProductCard extends Card {
  String name;
  String image;
  int price;

  ProductCard({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 400 ? 260 : 220;
    double widthMedia = MediaQuery.of(context).size.width > 400 ? 165 : 250;
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
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
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
                          regularAppText(
                              name.length > 30
                                  ? '${name.substring(0, 30)}...'
                                  : name,
                              18),
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
            Positioned(
              top: 145,
              right: 6,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: bisneColorPrimary),
                padding: const EdgeInsets.all(7),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
