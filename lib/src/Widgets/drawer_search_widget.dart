// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';
// import 'dart:html';
// import 'dart:math';

import 'package:bisne/src/Pages/Home/Providers/CategoryProvider.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerSearchWidget extends StatefulWidget {
  @override
  State<DrawerSearchWidget> createState() => _DrawerSearchWidgetState();
}

class _DrawerSearchWidgetState extends State<DrawerSearchWidget> {
  String categoria = '';
  String provincia = '';
  String municipio = '';
  String moneda = '';

  List<String> categories =
      CategoryProvider.categories.map((category) => category['name']!).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: MediaQuery.of(context).size.height - 185,
      child: Drawer(
        width: MediaQuery.of(context).size.width > 400
            ? MediaQuery.of(context).size.width * 0.6
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
                      Text('FILTRAR RESULTADOS',
                          style:
                              TextStyle(color: Color.fromRGBO(0, 0, 0, 0.451))),
                      InkWell(
                        child: Text('LIMPIAR',
                            style: TextStyle(color: bisneColorPrimary)),
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
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/Icons/arrow_rigth_icon.svg'),
                            ),
                          ),
                        ),
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
                  SizedBox(
                    height: 20.0,
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
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/Icons/arrow_rigth_icon.svg'),
                            ),
                          ),
                        ),
                        items: const [
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('MUNICIPIO'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: municipio == '' ? 'Todos' : municipio,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/Icons/arrow_rigth_icon.svg'),
                            ),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem<dynamic>(
                            value: 'Todos',
                            child: Text('Todos'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Playa',
                            child: Text('Playa'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Marianao',
                            child: Text('Marianao'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'Vedado',
                            child: Text('Vedado'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'La Lisa',
                            child: Text('La Lisa'),
                          ),
                        ],
                        onChanged: (Object? value) {
                          municipio = value as String;
                          setState(() {});
                        },
                        // [
                        //   DropdownMenuEntry<dynamic>(value: 'hola', label: "hola")
                        // ]
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('MONEDA'),
                      // ignore: prefer_const_literals_to_create_immutables

                      DropdownButton<dynamic>(
                        underline: Container(),
                        value: moneda == '' ? 'CUP' : moneda,
                        isDense: true,
                        style:
                            TextStyle(color: Color.fromRGBO(23, 26, 22, 0.549)),
                        alignment: Alignment.centerRight,
                        icon: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/Icons/arrow_rigth_icon.svg'),
                            ),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem<dynamic>(
                            value: 'CUP',
                            child: Text('CUP'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'USD',
                            child: Text('USD'),
                          ),
                          DropdownMenuItem<dynamic>(
                            value: 'MLC',
                            child: Text('MLC'),
                          )
                        ],
                        onChanged: (Object? value) {
                          moneda = value as String;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            backgroundColor:
                                MaterialStatePropertyAll(bisneColorPrimary)),
                        onPressed: () => {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "APLICAR FLITROS",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                                'assets/Icons/arrow_rigth_icon.svg')
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
