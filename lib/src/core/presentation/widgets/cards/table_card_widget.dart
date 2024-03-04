import 'package:bisne/src/Pages/products/presentation/screens/product_page.dart';
import 'package:bisne/src/Pages/products/presentation/widgets/product_card_widget.dart';
import 'package:bisne/src/Pages/shop/presentation/screens/shop_page.dart';
import 'package:flutter/material.dart';

import '../../../../Pages/shop/domain/entities/shop_entity.dart';

class TableCardWidget extends StatelessWidget {
  final int maxColumns;
  final List<Shop?> data;
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
      {required List<Shop?> cards, required BuildContext context}) {
    List<TableRow> listOfColums = [];
    int columIndex = 1;
    List<Container> colmuns = [];
    for (Shop? card in cards) {
      print(columIndex);
      if (columIndex == maxColumns) {
        colmuns.add(
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Align(
              alignment: Alignment.center,
              child: BisneCard(
                name: card!.shopName,
                description: card.shopDescription,
                image: card.imageUrl,
                rate: '4.5',
                heightCard: MediaQuery.sizeOf(context).width > 550 ? 170 : 130,
                widthCard: MediaQuery.sizeOf(context).width > 550 ? 180 : 145,
                onpressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const ShopPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
            ),
          ),
        );

        listOfColums.add(
          TableRow(
            children: colmuns,
          ),
        );
        colmuns = [];
        columIndex = 1;

        continue;
      }
      colmuns.add(
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.center,
            child: BisneCard(
              name: card!.shopName,
              description: card.shopDescription,
              image: card.imageUrl,
              rate: '4.5',
              heightCard: MediaQuery.sizeOf(context).width > 550 ? 170 : 130,
              widthCard: MediaQuery.sizeOf(context).width > 550 ? 180 : 145,
              onpressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const ShopPage(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
          ),
        ),
      );
      columIndex++;
    }

    return listOfColums;
  }
}
