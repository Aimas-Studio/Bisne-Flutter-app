import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../home/infrastructure/services/shops_provider.dart';

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
                style: TextStyle(color: fontAppColor, fontSize: 12),
              )),
              Tab(
                  child: Text('Productos',
                      style: TextStyle(color: fontAppColor, fontSize: 12))),
              Tab(
                  child: Text('Servicio',
                      style: TextStyle(color: fontAppColor, fontSize: 12))),
              Tab(
                  child: Text('Eventos',
                      style: TextStyle(color: fontAppColor, fontSize: 12)))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
              future: ShopsProvider().cargarData(8),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TabBarView(
                    children: [
                      ListView(
                        children: [
                          // createShopTable(context, snapshot.data!)
                        ],
                      ),
                      ListView(
                        children: [
                          // createShopTable(context, snapshot.data!)
                        ],
                      ),
                      ListView(
                        children: [
                          // createShopTable(context, snapshot.data!)
                        ],
                      ),
                      ListView(
                        children: [
                          // createShopTable(context, snapshot.data!)
                        ],
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