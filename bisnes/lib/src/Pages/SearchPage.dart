import 'dart:ffi';
import 'dart:math';

import 'package:bisnes/src/Pages/HomePage.dart';
import 'package:bisnes/src/widgets/BottomNavBar.dart';
import 'package:bisnes/src/widgets/DrawerSearchWidget.dart';
import 'package:bisnes/src/widgets/SearchImputWidget.dart';
import 'package:bisnes/src/widgets/TableShopWidget.dart';
import 'package:flutter/material.dart';

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
          appBar: AppBar(
            actions: [
              Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(top: 15, right: 10, bottom: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Image.asset('assets/icon/filter_icon.png'),
                    ));
              }),
            ],
            backgroundColor: Color.fromRGBO(245, 246, 248, 1),
            title: Row(
              children: [
                SearchInputFb1(
                  hintText: 'Buscar Productos...',
                  searchController: SearchController(),
                ),
              ],
            ),
            toolbarHeight: 80,
            shadowColor: Color.fromRGBO(245, 246, 248, 1),
            bottom: const TabBar(
              indicatorColor: Color.fromRGBO(29, 173, 3, 1),
              indicatorPadding: EdgeInsets.only(bottom: 7),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                    child: Text(
                  'Tiendas',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 92, 111, 1), fontSize: 13),
                )),
                Tab(
                    child: Text('Productos',
                        style: TextStyle(
                            color: Color.fromRGBO(81, 92, 111, 41),
                            fontSize: 13))),
                Tab(
                    child: Text('Servicio',
                        style: TextStyle(
                            color: Color.fromRGBO(81, 92, 111, 41),
                            fontSize: 13))),
                Tab(
                    child: Text('Eventos',
                        style: TextStyle(
                            color: Color.fromRGBO(81, 92, 111, 41),
                            fontSize: 13)))
              ],
            ),
          ),
          endDrawer: DrawerSearchWidget(),
          body: TabBarView(
            children: [
              ListView(children: [
                TableShopWidget(
                    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2),
              ]),
              ListView(children: [
                TableShopWidget(
                    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2),
              ]),
              ListView(children: [
                TableShopWidget(
                    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2),
              ]),
              ListView(children: [
                TableShopWidget(
                    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2),
              ]),
            ],
          ),
          bottomNavigationBar: BottomNavBar()),
    );
  }
}
