// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, sort_child_properties_last
//Flutter Imports
//Internal Imports
import 'package:bisnes/src/providers/CategoryProvider.dart';
import 'package:bisnes/src/providers/PromotionalProvider.dart';
import 'package:bisnes/src/widgets/BannerPromocionalWidget.dart';
import 'package:bisnes/src/widgets/BottomNavBar.dart';
import 'package:bisnes/src/widgets/DrawerHomeWidget.dart';
import 'package:bisnes/src/widgets/SearchImputWidget.dart';
import 'package:bisnes/src/widgets/TableShopWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String section = 'Populares';
  final index = 2;
  @override
  Widget build(BuildContext context) {
    double media = MediaQuery.sizeOf(context).width > 400
        ? MediaQuery.sizeOf(context).height * 0.24
        : MediaQuery.sizeOf(context).height * 0.15;
    double mediaViewPort = MediaQuery.sizeOf(context).width > 400 ? 0.14 : 0.25;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: ListTile(
          title: Text(
            'El Bisnes',
            maxLines: 1,
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          leading: SvgPicture.asset('assets/Icons/bisne_logo_icon.svg'),
        ),
        actions: <Widget>[
          Builder(
              builder: (context) => InkWell(
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: SvgPicture.asset(
                          'assets/Icons/options_menu_home_icon.svg'),
                    ),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )),
        ],
        forceMaterialTransparency: true,
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: DrawerHomeWidget(),
      drawerScrimColor: Colors.white70,
      body: ListView(
        children: [
          BannerSwiper(),
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
                      height: media,
                      padding: EdgeInsets.only(left: 15.0),
                      child: PageView(
                        padEnds: false,
                        controller:
                            PageController(viewportFraction: mediaViewPort),
                        scrollDirection: Axis.horizontal,
                        children: _setCategories(
                            snapshot.hasData ? snapshot.data! : []),
                      ),
                    );
                  })
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SearchInputFb1(
                hintText: 'Buscar Productos...',
                searchController: SearchController(),
              ),
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(top: 0, right: 5, bottom: 0, left: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/Icons/filter_search_icon.svg',
                      height: 20),
                ),
              )
            ],
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
          TableShopWidget(
              maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        index: 2,
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
            SvgPicture.asset(category["icon"], height: 75),
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
