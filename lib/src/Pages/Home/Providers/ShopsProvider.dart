import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ShopsProvider {
  List<Map<String, dynamic>> shops = [];

  Future<List<Map<String, dynamic>>> cargarData(int indexTest) async {
    final respuesta = await rootBundle.loadString('data/shops.json');
    Map<dynamic, dynamic> shopsJson = json.decode(respuesta);
    for (var shop in shopsJson["populate"]) {
      shops.add({
        "name": shop["name"],
        "description": shop["description"],
        "image": shop["image"],
        "rate": shop["rate"]
      });
    }

    return Future.delayed(const Duration(seconds: 2), () {
      return shops;
    });
  }
}
