//Dart Imports

import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/buttons/category_button.dart';
import '../../../../core/presentation/widgets/inputs/search_input_widget.dart';
import '../../../home/infrastructure/services/shops_provider.dart';
import '../controllers/search_page_controller.dart';
import '../widgets/drawer_search_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchPageController _ = Get.find<SearchPageController>();
    return Scaffold(
      endDrawer: DrawerSearchWidget(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () async {},
            stretchTriggerOffset: 150.0,
            actions: [Container()],
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: 100,
                child: appbarSearchPage(),
              ),
              titlePadding: const EdgeInsets.only(bottom: 0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buildButtons(context, _),
                    ),
                  ),
                ],
              ),
            ),
            floating: false,
            pinned: true,
            snap: false,
          ),
          SliverToBoxAdapter(
              child: StreamBuilder(
            stream: _.indexStream,
            builder: (context, snapshot) {
              return FutureBuilder(
                key: UniqueKey(),
                future: ShopsProvider().cargarData(_.selectedIndex.value),
                builder: (context, snapshot) => snapshot.hasData
                    ? const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/Images/placeholder_circle_logo.png'),
                              height: 150,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RegularAppText(
                              text:
                                  'Lo sentimos,\nno existen resultados\n para su búsqueda.',
                              size: 20,
                              align: TextAlign.center,
                            )
                          ],
                        ),
                      )
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
              );
            },
          )),
        ],
      ),
      endDrawerEnableOpenDragGesture: false,
    );
  }

  List<Widget> buildButtons(BuildContext context, SearchPageController _) {
    List<String> labels = ["Tiendas", "Productos", "Servicios"];
    List<Widget> buttons = [];

    for (int i = 0; i < labels.length; i++) {
      buttons.add(
        SizedBox(
          height: 30,
          child: Obx(
            () => CategoryButton(
                isPressed: _.selectedIndex.value == i,
                onPressed: () {
                  _.selectedIndex.value = i;
                },
                label: labels[i],
                maincolor: iconAppColor),
          ),
        ),
      );
    }

    return buttons;
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
