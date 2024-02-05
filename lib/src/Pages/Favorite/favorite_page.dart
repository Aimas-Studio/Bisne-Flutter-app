import 'package:bisne/src/Pages/Home/Providers/ShopsProvider.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Widgets/card_tables.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Favoritos')),
          toolbarHeight: 80,
          bottom: const TabBar(
            indicatorColor: bisneColorPrimary,
            indicatorPadding: EdgeInsets.only(bottom: 7),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                  child: Text(
                'Todas',
                style: TextStyle(color: fontAppColor, fontSize: 13),
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
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
              future: ShopsProvider.cargarData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TabBarView(
                    children: [
                      ListView(
                        children: [createShopTable(context, snapshot.data!)],
                      ),
                      ListView(
                        children: [createShopTable(context, snapshot.data!)],
                      ),
                      ListView(
                        children: [createShopTable(context, snapshot.data!)],
                      ),
                      ListView(
                        children: [createShopTable(context, snapshot.data!)],
                      ),
                    ],
                  );
                } else {
                  return TabBarView(
                    children: [ListView(), ListView(), ListView(), ListView()],
                  );
                }
              }),
        ),
      ),
    );
  }
}
