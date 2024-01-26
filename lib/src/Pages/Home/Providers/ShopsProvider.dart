import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ShopsProvider {
  List<Map<String, dynamic>> shops = [];

  _ShopsProvider() {}

  Future<List<Map<String, dynamic>>> cargarData() async {
    if (shops.length == 0) {
      final respuesta = await rootBundle.loadString('data/shops.json');
      Map<dynamic, dynamic> shops_json = json.decode(respuesta);

      for (var shop in shops_json["populate"]) {
        shops.add({
          "name": shop["name"],
          "categories": shop["categories"],
          "image": shop["image"],
          "rate": shop["rate"]
        });
      }
    }
    return shops;
  }
}

final ShopsProvider = new _ShopsProvider();
