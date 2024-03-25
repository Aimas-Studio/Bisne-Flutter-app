import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../user/export.dart';

AppBar appbarHomePage() {
  return AppBar(
    toolbarHeight: 100,
    title: ListTile(
      title: RegularAppText(
          text:
              'Hola, ${getUserInfo().username == '' ? 'Carlos' : getUserInfo().username}',
          size: 16),
      subtitle: const BoldAppText(text: 'Bienvenido al Bisne', size: 18),
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
