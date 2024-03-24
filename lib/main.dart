import 'package:bisne/src/core/infrastructure/graphql/graphql_config.dart';
import 'package:bisne/src/models/base/presentation/screens/base_page.dart';
import 'package:bisne/src/models/cart/presentation/controllers/cart_page_controller.dart';
import 'package:bisne/src/models/search/presentation/controllers/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'src/core/infrastructure/init/init_app.dart';

void main() async {
  await initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SearchPageController _SearchPageController =
      Get.put(SearchPageController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(client),
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'El Bisne',
        home: BasePage(),
      ),
    );
  }
}
