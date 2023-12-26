// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BisnesCard extends StatelessWidget {
  String name = '';
  List<dynamic> categories = [];
  String image = '';
  String rate = '';

  BisnesCard({
    Key? key,
    required this.name,
    required this.categories,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.width > 400 ? 230 : 220;
    double widthMedia = MediaQuery.of(context).size.width > 400 ? 150 : 250;
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  width: widthMedia,
                ),
                Expanded(
                  child: Container(
                    child: ListTile(
                      title: Text(name),
                      subtitle: Text(categories[0],
                          style: TextStyle(color: Colors.green)),
                    ),
                  ),
                )
              ],
            ),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.0)]),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(10.0),
            height: heightMedia,
            width: widthMedia,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0), right: Radius.circular(20.0))),
            alignment: Alignment.topLeft,
            width: 55.0,
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(this.rate, style: TextStyle(fontSize: 17.0)),
                SizedBox(
                  width: 6.0,
                ),
                Image.asset('assets/icon/yellow_star.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
