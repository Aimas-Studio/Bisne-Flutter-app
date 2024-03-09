import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../user/export.dart';
import '../../infrastructure/services/category_provider.dart';

AppBar appbarHomePage() {
  return AppBar(
    toolbarHeight: 100,
    title: ListTile(
      title:
          ThinAppText(text: 'Bienvenido ${getUserInfo().username},', size: 16),
      subtitle: const RegularAppText(text: 'Explora y haz tu bisne', size: 18),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/Images/hero.png'),
        radius: 30,
      ),
    ),
    actions: <Widget>[
      Builder(
          builder: (context) => InkWell(
                child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.menu_rounded,
                        color: iconAppColor, size: 45.0)),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              )),
    ],
    forceMaterialTransparency: true,
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

Padding searchRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      children: [
        Expanded(
          flex: 98,
          child: SearchInput(
            hintText: 'Buscar Productos...',
            searchController: SearchController(),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: const Center(
              child: Icon(
            Icons.filter_alt_rounded,
            color: iconAppColor,
          )),
        ),
      ],
    ),
  );
}

FutureBuilder<List<Map<String, String>>> categoryIcons(
    double mediaViewPort, String section) {
  return FutureBuilder(
      future: CategoryProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Container(
          height: 125,
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
