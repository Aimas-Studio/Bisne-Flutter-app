// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:bisnes/src/widgets/ShopCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomePage extends StatelessWidget {
  late List<Map<String, String>> categories;
  late List<String> images;
  HomePage({super.key}) {
    images = [
      'assets/fotos/hero.png',
      'assets/fotos/hero.png',
      'assets/fotos/hero.png',
      'assets/fotos/hero.png',
      'assets/fotos/hero.png'
    ];
  }

  @override
  Widget build(BuildContext context) {
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
          leading: Image(image: AssetImage('assets/icon/bisne_logo.png')),
          trailing: Image(image: AssetImage('assets/icon/menu_home_icon.png')),
        ),
        forceMaterialTransparency: true,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  images[index],
                  fit: BoxFit.fitWidth,
                );
              },
              indicatorLayout: PageIndicatorLayout.SCALE,
              autoplay: true,
              autoplayDelay: 5000,
              itemCount: images.length,
              pagination: new SwiperPagination(
                margin: EdgeInsetsGeometry.lerp(
                    EdgeInsets.all(0.0), EdgeInsets.all(0.0), 0.0)!,
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey[350],
                    activeColor: Colors.green[400],
                    size: 13.0,
                    space: 10.0),
              ),
              fade: 1.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
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
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.only(left: 20.0),
            child: PageView(
              padEnds: false,
              controller: PageController(viewportFraction: 0.24),
              scrollDirection: Axis.horizontal,
              children: _setCategoriesOffline(),
            ),
          ),
          Container(
            child: Text('Populares',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.only(left: 30.0),
          ),
          SizedBox(
            height: 15.0,
          ),
          Table(
            children: [_card(context), _card(context), _card(context)],
          )
        ],
      ),
    );
  }

  TableRow _card(BuildContext context) {
    return TableRow(children: [BisnesCard(), BisnesCard()]);
  }

  List<Widget> _setCategories(List<Map<String, String>> categories) {
    List<Widget> categories_finished = [];
    for (Map<String, String> category in categories) {
      categories_finished.add(Column(
        children: [
          Image.asset('assets/icon/${category['icon']!}'),
          SizedBox(),
          Text(category['name']!)
        ],
      ));
    }
    return categories_finished;
  }

  List<Widget> _setCategoriesOffline() {
    List<Widget> categories_finished = [
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      ),
      Column(
        children: [
          Image.asset('assets/icon/all_icon.png'),
          SizedBox(),
          Text('Todos')
        ],
      )
    ];
    return categories_finished;
  }
}
