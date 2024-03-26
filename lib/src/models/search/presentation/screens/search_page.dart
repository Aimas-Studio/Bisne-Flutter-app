//Dart Imports

import 'package:bisne/src/core/presentation/widgets/buttons/categories_row.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:bisne/src/core/utils/search_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/buttons/category_button.dart';
import '../../../../core/presentation/widgets/inputs/search_input_widget.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../home/infrastructure/services/shops_provider.dart';
import '../controllers/search_page_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchPageController _ = Get.find<SearchPageController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchRow(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: () => {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Expanded(
                      child: CategoriesRow(
                    controller: _,
                    labels: const ["Tiendas", "Productos"],
                  )),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: FutureBuilder(
            key: UniqueKey(),
            future: _.fetchShops(),
            builder: (context, snapshot) => snapshot.hasData
                ? TableCardWidget(
                    maxColumns: MediaQuery.sizeOf(context).width > 550 ? 3 : 2,
                    data: snapshot.data!,
                  )
                // const Padding(
                //     padding: EdgeInsets.only(top: 50),
                //     child: Column(
                //       children: [
                //         Image(
                //           image: AssetImage(
                //               'assets/Images/placeholder_circle_logo.png'),
                //           height: 150,
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         RegularAppText(
                //           text:
                //               'Lo sentimos,\nno existen resultados\n para su búsqueda.',
                //           size: 20,
                //           align: TextAlign.center,
                //         )
                //       ],
                //     ),
                //   )
                // createShopTable(context, snapshot.data!)
                : Center(
                    child: Table(
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
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  AppBar appbarSearchPage() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: filterIcon(),
        ),
      ],
      backgroundColor: backgroundAppColor,
      title: SearchInput(
        hintText: 'Buscar en el Bisne...',
        searchController: SearchController(),
      ),
      toolbarHeight: 100,
      shadowColor: backgroundAppColor,
    );
  }

  Builder filterIcon() {
    return Builder(builder: (context) {
      return InkWell(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: const Icon(Icons.filter_alt, color: iconAppColor)));
    });
  }
}
