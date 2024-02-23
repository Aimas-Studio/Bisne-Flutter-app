//Dart Imports

//Flutter Imports
import 'package:bisne/src/Pages/Home/Providers/ShopsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/Utils/interfaces.dart';
import '../../core/widgets/card_tables.dart';
import '../../core/widgets/search_input_widget.dart';
import 'Widgets/drawer_search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appbarSearchPage(),
        endDrawer: DrawerSearchWidget(),
        drawerScrimColor: Colors.white70,
        body: FutureBuilder(
          future: ShopsProvider.cargarData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      createShopTable(context, snapshot.data!)
                    ],
                  ),
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      createShopTable(context, snapshot.data!)
                    ],
                  ),
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      createShopTable(context, snapshot.data!)
                    ],
                  ),
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      createShopTable(context, snapshot.data!)
                    ],
                  ),
                ],
              );
            } else {
              return TabBarView(
                children: [ListView(), ListView(), ListView(), ListView()],
              );
            }
          },
        ),
        endDrawerEnableOpenDragGesture: false,
      ),
    );
  }

  AppBar appbarSearchPage() {
    return AppBar(
      actions: [
        filterIcon(),
      ],
      backgroundColor: backgroundAppColor,
      title: SearchInputFb1(
        hintText: 'Buscar Productos...',
        searchController: SearchController(),
      ),
      toolbarHeight: 80,
      shadowColor: backgroundAppColor,
      bottom: const TabBar(
        indicatorColor: bisneColorPrimary,
        indicatorPadding: EdgeInsets.only(bottom: 7),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
              child: Text(
            'Tiendas',
            style: TextStyle(color: fontAppColor, fontSize: 12),
          )),
          Tab(
              child: Text('Productos',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 92, 111, 41), fontSize: 12))),
          Tab(
              child: Text('Servicio',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 92, 111, 41), fontSize: 12))),
          Tab(
              child: Text('Eventos',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 92, 111, 41), fontSize: 12)))
        ],
      ),
    );
  }

  Builder filterIcon() {
    return Builder(builder: (context) {
      return InkWell(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Container(
              width: 50,
              margin: const EdgeInsets.only(top: 15, right: 10, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Center(
                child: SvgPicture.asset('assets/Icons/filter_search_icon.svg'),
              )));
    });
  }
}
