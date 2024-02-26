// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisne/src/Pages/Base/base_page.dart';
import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:bisne/src/Pages/Cart/cart_page_controller.dart';
import 'package:bisne/src/Pages/Search/search_page_controller.dart';
import 'package:bisne/src/core/init/init_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final BasePageController _BasePageController = Get.put(BasePageController());
  final SearchPageController _SearchPageController =
      Get.put(SearchPageController());
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Bisne',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => BasePage(),
      },
    );
  }
}
