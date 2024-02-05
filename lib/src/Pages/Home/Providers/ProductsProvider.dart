import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ProductsProvider {
  List<Map<String, dynamic>> products = [];

  _ProductsProvider();

  Future<List<Map<String, dynamic>>> cargarData() async {
    if (products.isEmpty) {
      final respuesta = await rootBundle.loadString('data/product.json');
      Map<dynamic, dynamic> productJson = json.decode(respuesta);

      for (var product in productJson["populate"]) {
        products.add({
          "name": product["name"],
          "image": product["image"],
          "price": product["price"]
        });
      }
    }
    print(products);
    return products;
  }
}

final productProvider = _ProductsProvider();
