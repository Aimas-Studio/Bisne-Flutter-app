import 'package:flutter/material.dart';

import '../Pages/Home/Providers/ShopsProvider.dart';
import 'bisnes_card_widget.dart';

class TableShopWidget extends StatelessWidget {
  int maxColumns = 2;
  TableShopWidget({super.key, required this.maxColumns});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShopsProvider.cargarData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Table(
              children: _createTableRow(shops: snapshot.data!),
            ),
          );
        }
        return Table();
      },
    );
  }

  List<TableRow> _createTableRow({required List<Map<String, dynamic>> shops}) {
    List<TableRow> listOfColums = [];
    int columIndex = 1;
    List<Container> colmuns = [];
    for (Map<String, dynamic> shop in shops) {
      if (columIndex == maxColumns) {
        colmuns.add(
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Align(
              alignment: Alignment.center,
              child: BisnesCard(
                name: shop["name"]!,
                categories: shop["categories"]!,
                image: shop["image"]!,
                rate: shop["rate"]!,
              ),
            ),
          ),
        );

        listOfColums.add(TableRow(
          children: colmuns,
        ));
        colmuns = [];
        columIndex = 1;
        continue;
      }
      colmuns.add(
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.center,
            child: BisnesCard(
              name: shop["name"]!,
              categories: shop["categories"]!,
              image: shop["image"]!,
              rate: shop["rate"]!,
            ),
          ),
        ),
      );
      columIndex++;
    }

    return listOfColums;
  }
}
