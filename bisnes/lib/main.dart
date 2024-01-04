// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bisnes/src/Pages/User/user_info_page.dart';
import 'package:bisnes/src/Pages/home_page.dart';
import 'package:bisnes/src/Pages/search_page.dart';
import 'package:bisnes/src/Utils/shared_persistent_data.dart';
import 'package:flutter/material.dart';

void main() async {
  final appData = PersistentData();
  await appData.loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'SearchPage': (BuildContext context) => SearchPage(),
        'User': (BuildContext context) => UserInfoPage()
      },
    );
  }
}
