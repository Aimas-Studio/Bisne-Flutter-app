import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _CategoryProvider {
  List<Map<String, String>> categories = [];
  bool hasLoad = false;

  Future<List<Map<String, String>>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/categories.json');
    List<dynamic> categories_json = json.decode(respuesta);
    if (!hasLoad) {
      for (var category in categories_json) {
        categories.add({"icon": category["icon"], "name": category["name"]});
      }
      hasLoad = true;
    }
    return categories;
  }
}

final CategoryProvider = new _CategoryProvider();
