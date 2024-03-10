import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../models/products/domain/product_entity.dart';
import '../../../../models/products/presentation/screens/product_page.dart';
import '../../../../models/products/presentation/widgets/product_card_widget.dart';
import '../../../../models/shop/export.dart';

class TableCardWidget extends StatelessWidget {
  final int maxColumns;
  final List<dynamic> data;

  const TableCardWidget({Key? key, this.maxColumns = 2, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        children: _createTableRow(cards: data, context: context),
      ),
    );
  }

  List<TableRow> _createTableRow(
      {required List<dynamic> cards, required BuildContext context}) {
    List<TableRow> listOfColums = [];
    List<Container> colmuns = [];

    int totalCards = cards.length;
    int totalCardsInSquare = pow(((sqrt(totalCards)).floor()) + 1, 2) as int;

    double heightCard = MediaQuery.sizeOf(context).width > 550 ? 170 : 130;
    double widthCard = MediaQuery.sizeOf(context).width > 550 ? 180 : 145;

    if (data is List<Product>) {
      heightCard = MediaQuery.of(context).size.width > 550 ? 190 : 155;
      widthCard = MediaQuery.of(context).size.width > 550 ? 160 : 145;
    }

    for (int i = 0; i < totalCardsInSquare; i++) {
      if (i < totalCards) {
        colmuns.add(
          Container(
            margin: const EdgeInsets.only(bottom: 15, left: 10),
            child: Align(
              alignment: Alignment.center,
              child: BisneCard(
                name: cards[i]!.name,
                description: cards[i]!.description,
                image: cards[i]!.imageUrl is List<String>
                    ? cards[i]!.imageUrl[0]
                    : cards[i]!.imageUrl,
                rate: '4.5',
                heightCard: heightCard,
                widthCard: widthCard,
                onpressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          (data is List<Product>)
                              ? ProductPage(product: data[i])
                              : ShopPage(shop: data[i]),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                price: (data is List<Product>) ? cards[i].price : null,
              ),
            ),
          ),
        );
      } else {
        colmuns.add(Container());
      }
      if (colmuns.length == maxColumns) {
        listOfColums.add(TableRow(children: colmuns));
        colmuns = [];
      }
    }

    return listOfColums;
  }
}
