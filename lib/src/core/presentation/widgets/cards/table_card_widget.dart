import 'dart:math';

import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../models/products/domain/entities/product_entity.dart';
import '../../../../models/products/presentation/screens/product_page.dart';
import '../../../../models/shop/export.dart';
import 'bisne_card_wiget.dart';

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
    if (cards.isEmpty) {
      return [
        const TableRow(children: [SizedBox()])
      ];
    }
    List<TableRow> listOfColums = [];
    List<Container> colmuns = [];

    int totalCards = cards.length;
    int totalCardsInSquare = pow(((sqrt(totalCards)).floor()) + 1, 2) as int;

    double heightCard = MediaQuery.sizeOf(context).width > 550 ? 170 : 130;
    double widthCard = MediaQuery.sizeOf(context).width > 550 ? 180 : 145;

    if (cards[0] is Product) {
      heightCard = MediaQuery.of(context).size.width > 550 ? 150 : 110;
    }

    for (int i = 0; i < totalCardsInSquare; i++) {
      if (i < totalCards) {
        colmuns.add(
          Container(
            margin:
                const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 5),
            child: Align(
              alignment: Alignment.center,
              child: BisneCard(
                name: BoldAppText(
                  text: cards[i]!.name,
                  size: 16,
                  color: Colors.black,
                  align: (cards[0] is Product)
                      ? TextAlign.start
                      : TextAlign.center,
                ),
                category: RegularAppText(
                  text: (cards[0] is Product)
                      ? cards[i].shop.name
                      : cards[i].category,
                  size: 12,
                  maxLines: 1,
                  align: (cards[0] is Product)
                      ? TextAlign.start
                      : TextAlign.center,
                ),
                image: cards[i]!.imageUrl is List<String>
                    ? cards[i]!.imageUrl[0]
                    : cards[i]!.imageUrl,
                rate: '4.5',
                heightCard: heightCard,
                widthCard: widthCard,
                onpressed: () {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              (cards[0] is Product)
                                  ? ProductPage(product: cards[i])
                                  : ShopPage(shop: cards[i]),
                        ),
                      );
                    },
                  );
                },
                id: cards[i]!.id,
                isFavorite: cards[i]!.isFavorite,
                price: (cards[0] is Product) ? cards[i].price : null,
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
