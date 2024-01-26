// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'src/Pages/Home/home_page.dart';
import 'src/Pages/User/user_info_page.dart';
import 'src/Pages/search_page.dart';
import 'src/Utils/shared_persistent_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appData = PersistentData();
  await appData.loadData();
  runApp(MyApp());
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
