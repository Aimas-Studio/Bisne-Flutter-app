import 'package:flutter/material.dart';

class DrawerHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.amber,
      width: MediaQuery.of(context).size.width > 400
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.7,
      child: Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
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
                    text: 'Publicar mi negocio',
                    icon: Icons.add,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Invitar amigo',
                    icon: Icons.star,
                    onClicked: () => selectedItem(context, 3),
                  ),
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
          builder: (context) => Scaffold(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Scaffold(), // Page 2
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
    final color = Color.fromRGBO(114, 124, 142, 100);
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
