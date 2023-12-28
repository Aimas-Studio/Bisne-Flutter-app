// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:bisnes/src/providers/CategoryProvider.dart';
import 'package:flutter/material.dart';

class DrawerSearchWidget extends StatefulWidget {
  @override
  State<DrawerSearchWidget> createState() => _DrawerSearchWidgetState();
}

class _DrawerSearchWidgetState extends State<DrawerSearchWidget> {
  String categoria = '';
  String provincia = '';

  final List<String> categories =
      CategoryProvider.categories.map((category) => category['name']!).toList();

  @override
  Widget build(BuildContext context) {
    print(categoria);
    print('');
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height - 185,
      child: Drawer(
        clipBehavior: Clip.antiAlias,
        width: MediaQuery.of(context).size.width > 400
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.7,
        child: Material(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('FILTRAR RESULTADOS'),
                      InkWell(
                        child: Text('LIMPIAR',
                            style: TextStyle(
                                color: Color.fromRGBO(29, 173, 3, 1))),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('CATEGORÍA'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: categoria == '' ? 'Todos' : categoria,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.arrow_circle_right_outlined)),
                        items: categories
                            .map((category) => DropdownMenuItem<dynamic>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (Object? value) {
                          categoria = value as String;
                          setState(() {});
                        },
                        // [
                        //   DropdownMenuEntry<dynamic>(value: 'hola', label: "hola")
                        // ]
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('PROVINCIA'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: provincia == '' ? 'Todas' : provincia,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.arrow_circle_right_outlined)),
                        items: [
                          DropdownMenuItem<dynamic>(
                            value: 'Todas',
                            child: Text('Todas'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'La Habana',
                            child: Text('La Habana'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Holguín',
                            child: Text('Holguín'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Las Tunas',
                            child: Text('Las Tunas'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Matanzas',
                            child: Text('Matanzas'),
                          ),
                        ],
                        onChanged: (Object? value) {
                          provincia = value as String;
                          setState(() {});
                        },
                        // [
                        //   DropdownMenuEntry<dynamic>(value: 'hola', label: "hola")
                        // ]
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('CATEGORÍA'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: categoria == '' ? 'Todos' : categoria,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.arrow_circle_right_outlined)),
                        items: categories
                            .map((category) => DropdownMenuItem<dynamic>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (Object? value) {
                          categoria = value as String;
                          setState(() {});
                        },
                        // [
                        //   DropdownMenuEntry<dynamic>(value: 'hola', label: "hola")
                        // ]
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('CATEGORÍA'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: categoria == '' ? 'Todos' : categoria,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.arrow_circle_right_outlined)),
                        items: categories
                            .map((category) => DropdownMenuItem<dynamic>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (Object? value) {
                          categoria = value as String;
                          setState(() {});
                        },
                        // [
                        //   DropdownMenuEntry<dynamic>(value: 'hola', label: "hola")
                        // ]
                      ),
                    ],
                  ),
                ],
              ),
            )),
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
