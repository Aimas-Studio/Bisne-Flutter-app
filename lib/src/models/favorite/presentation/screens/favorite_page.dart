import 'package:bisne/src/core/presentation/widgets/buttons/categories_row.dart';
import 'package:bisne/src/core/presentation/widgets/cards/table_card_widget.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

import '../../controller/favorite_page_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritePageController();
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: BoldAppText(
                  text: 'Favoritos',
                  size: 25,
                  color: Colors.black,
                )),
              ),
              CategoriesRow(
                  controller: controller,
                  labels: const ['Tiendas', 'Productos'])
            ],
          ),
          toolbarHeight: 100,
        ),
        body: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              FutureBuilder(
                future: controller.fetchShops(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TableCardWidget(
                      maxColumns:
                          MediaQuery.sizeOf(context).width > 550 ? 3 : 2,
                      data: snapshot.data!,
                    );
                  } else {
                    return
                        // Container();
                        Table(
                      children: const [
                        TableRow(children: [
                          Image(
                              image: AssetImage(
                                  'assets/Images/placeholder_baner.png')),
                          Image(
                              image: AssetImage(
                                  'assets/Images/placeholder_baner.png'))
                        ]),
                        TableRow(children: [
                          Image(
                              image: AssetImage(
                                  'assets/Images/placeholder_baner.png')),
                          Image(
                              image: AssetImage(
                                  'assets/Images/placeholder_baner.png'))
                        ])
                      ],
                    );
                  }
                },
              ),
            ],
          )),
        ));
  }
}
