import 'package:flutter/material.dart';

class TableCardWidget<T extends Card> extends StatelessWidget {
  final int maxColumns;
  final List<Map<String, dynamic>> data;
  final T Function(Map<String, dynamic>) cardFactory;
  const TableCardWidget(
      {Key? key,
      this.maxColumns = 2,
      required this.cardFactory,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        children: _createTableRow(cards: data),
      ),
    );
  }

  List<TableRow> _createTableRow({required List<Map<String, dynamic>> cards}) {
    List<TableRow> listOfColums = [];
    int columIndex = 1;
    List<Container> colmuns = [];
    for (Map<String, dynamic> card in cards) {
      if (columIndex == maxColumns) {
        colmuns.add(
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Align(alignment: Alignment.center, child: cardFactory(card)),
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
          child: Align(alignment: Alignment.center, child: cardFactory(card)),
        ),
      );
      columIndex++;
    }

    return listOfColums;
  }
}
