import 'package:bisne/src/Pages/Shop/shop_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerHomeWidget extends StatelessWidget {
  const DrawerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width > 400 ? context.width * 0.4 : context.width * 0.8,
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  MenuItem(
                    text: 'Administrar Tienda',
                    icon: Icons.maps_home_work_outlined,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Promocionarse',
                    icon: Icons.stacked_line_chart_sharp,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Contactar Equipo',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  MenuItem(
                    text: 'Compartir App',
                    icon: Icons.share,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  MenuItem(
                    text: 'Condiciones de uso',
                    icon: Icons.devices_fold_sharp,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShopInfoPage(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 2
        ));
        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(114, 124, 142, 100);
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
