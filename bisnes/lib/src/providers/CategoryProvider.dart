import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _CategoryProvider {
  List<Map<String, String>> categories = [];

  _CategoryProvider() {}

  Future<List<Map<String, String>>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/categories.json');
    List<dynamic> categories_json = json.decode(respuesta);
    for (var category in categories_json) {
      categories.add({"icon": category["icon"], "name": category["name"]});
    }
    return categories;
  }
}

final CategoryProvider = new _CategoryProvider();
