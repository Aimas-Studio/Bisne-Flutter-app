import 'package:bisne/src/core/infrastructure/graphql/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'src/Pages/Base/base_page.dart';
import 'src/Pages/Base/base_page_controller.dart';
import 'src/Pages/Cart/cart_page_controller.dart';
import 'src/Pages/Search/controllers/search_page_controller.dart';
import 'src/core/infrastructure/init/init_app.dart';

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
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(client),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'El Bisne',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => BasePage(),
        },
      ),
    );
  }
}
