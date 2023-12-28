// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:bisnes/src/providers/CategoryProvider.dart';
import 'package:bisnes/src/widgets/BannerPromocionalWidget.dart';
import 'package:bisnes/src/widgets/SearchImputWidget.dart';
import 'package:bisnes/src/widgets/TableShopWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String section = 'Populares';

  @override
  Widget build(BuildContext context) {
    // print(ShopsProvider.shops.length);
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text(
            'El Bisnes',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          leading: Image(image: AssetImage('assets/Icons/bisne_logo.png')),
          trailing: Image(image: AssetImage('assets/Icons/menu_home_icon.png')),
        ),
        forceMaterialTransparency: true,
      ),
      body: ListView(
        children: [
          BannerPromotionalWidget(),
          SizedBox(
            height: 25.0,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text('Categorías',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(left: 30.0),
              ),
              SizedBox(
                height: 18.0,
              ),
              FutureBuilder(
                  future: CategoryProvider.cargarData(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      padding: EdgeInsets.only(left: 15.0),
                      child: PageView(
                        padEnds: false,
                        controller: PageController(
                            viewportFraction:
                                MediaQuery.of(context).size.width * 0.00077),
                        scrollDirection: Axis.horizontal,
                        children: _setCategories(
                            snapshot.hasData ? snapshot.data! : []),
                      ),
                    );
                  })
            ],
          ),
          SearchInputFb1(
            hintText: 'Buscar Productos...',
            searchController: SearchController(),
          ),
          SizedBox(height: 15.0),
          Container(
            child: Text(section,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.only(left: 30.0),
          ),
          SizedBox(
            height: 15.0,
          ),
          TableShopWidget(maxColumns: 2),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  List<Widget> _setCategories(List<dynamic> categories) {
    return categories.map((category) {
      return InkWell(
        onTap: () {
          section = category["name"];
          setState(() {});
        },
        child: Column(
          children: [
            Image(image: AssetImage(category["icon"])),
            Center(
                child: Text(
              category["name"],
              textAlign: TextAlign.center,
            ))
          ],
        ),
      );
    }).toList();
  }
}
