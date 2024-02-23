import 'package:flutter/material.dart';

import '../../../Pages/Shop/shop_page.dart';

class ShopCard extends Card {
  String name;
  List<dynamic> categories;
  String image;
  String rate;

  ShopCard({
    Key? key,
    required this.name,
    required this.categories,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 400 ? 240 : 220;
    double widthMedia = MediaQuery.of(context).size.width > 400 ? 165 : 145;
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
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 3.0)
                ]),
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
                  child: ListTile(
                    title: Text(name),
                    subtitle: Text(categories[0],
                        style: const TextStyle(color: Colors.green)),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0), right: Radius.circular(20.0))),
            alignment: Alignment.topLeft,
            width: 55.0,
            margin: const EdgeInsets.only(top: 15.0, left: 15.0),
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(rate, style: const TextStyle(fontSize: 17.0)),
                const SizedBox(
                  width: 6.0,
                ),
                Image.asset('assets/Icons/yellow_star.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
