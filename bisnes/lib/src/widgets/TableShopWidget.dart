import 'package:flutter/material.dart';

import 'package:bisnes/src/providers/ShopsProvider.dart';
import 'package:bisnes/src/widgets/BisnesCardWidget.dart';

class TableShopWidget extends StatelessWidget {
  int maxColumns = 2;
  TableShopWidget({super.key, required this.maxColumns});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShopsProvider.cargarData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Table(children: _createTableRow(shops: snapshot.data!));
        }
        return Table();
      },
    );
  }

  List<TableRow> _createTableRow({required List<Map<String, dynamic>> shops}) {
    List<TableRow> listOfColums = [];
    int colum_index = 1;
    List<BisnesCard> colmuns = [];
    for (Map<String, dynamic> shop in shops) {
      if (colum_index == this.maxColumns) {
        colmuns.add(BisnesCard(
            name: shop["name"]!,
            categories: shop["categories"]!,
            image: shop["image"]!,
            rate: shop["rate"]!));

        listOfColums.add(TableRow(children: colmuns));
        colmuns = [];
        colum_index = 1;
        continue;
      }
      colmuns.add(BisnesCard(
          name: shop["name"]!,
          categories: shop["categories"]!,
          image: shop["image"]!,
          rate: shop["rate"]!));
      colum_index++;
    }

    return listOfColums;
  }
}
