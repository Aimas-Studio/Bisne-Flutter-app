import 'package:bisne/src/Pages/Home/Providers/CategoryProvider.dart';
import 'package:bisne/src/Pages/Home/Providers/ShopsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/card_tables.dart';
import '../../../core/widgets/search_input_widget.dart';

AppBar appbarHomePage() {
  return AppBar(
    toolbarHeight: 80,
    title: ListTile(
      title: const Text(
        'El Bisne',
        maxLines: 1,
        style: TextStyle(
            fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: SvgPicture.asset('assets/Icons/bisne_logo_icon.svg'),
    ),
    actions: <Widget>[
      Builder(
          builder: (context) => InkWell(
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                      'assets/Icons/options_menu_home_icon.svg'),
                ),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              )),
    ],
    forceMaterialTransparency: true,
  );
}

Widget sectionShops(BuildContext context) {
  return FutureBuilder(
    future: ShopsProvider.cargarData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return createShopTable(context, snapshot.data!);
      } else {
        return Container();
      }
    },
  );
}

Container sectionName(section) {
  return Container(
    padding: const EdgeInsets.only(left: 30.0),
    alignment: Alignment.centerLeft,
    child: Text(
      section,
      style: const TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}

Row searchRow() {
  return Row(
    children: [
      const SizedBox(
        width: 25,
      ),
      SearchInputFb1(
        hintText: 'Buscar Productos...',
        searchController: SearchController(),
      ),
      Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(top: 0, right: 5, bottom: 0, left: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Center(
          child: SvgPicture.asset('assets/Icons/filter_search_icon.svg',
              height: 20),
        ),
      )
    ],
  );
}

FutureBuilder<List<Map<String, String>>> categoryIcons(
    double media, double mediaViewPort, String section) {
  return FutureBuilder(
      future: CategoryProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Container(
          height: media,
          padding: const EdgeInsets.only(left: 15.0),
          child: PageView(
            padEnds: false,
            controller: PageController(viewportFraction: mediaViewPort),
            scrollDirection: Axis.horizontal,
            children:
                _setCategories(snapshot.hasData ? snapshot.data! : [], section),
          ),
        );
      });
}

Container categoryText() {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 30.0),
    child: const Text('Categorías',
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold)),
  );
}

List<Widget> _setCategories(List<dynamic> categories, String section) {
  return categories.map((category) {
    return InkWell(
      onTap: () {
        section = category["name"];
      },
      child: Column(
        children: [
          SvgPicture.asset(category["icon"], height: 75),
          Center(
              child: Text(
            category["name"],
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }).toList();
}
