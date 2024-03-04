import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ProductsProvider {
  List<Map<String, dynamic>> products = [];

  Future<List<Map<String, dynamic>>> cargarData(int indexTest) async {
    final respuesta = await rootBundle.loadString('data/product.json');
    Map<dynamic, dynamic> productsJson = json.decode(respuesta);
    for (var product in productsJson["populate"]) {
      products.add({
        "name": product["name"],
        "image": product["image"],
        "price": product["price"]
      });
    }
    print(products);
    return Future.delayed(const Duration(seconds: 2), () {
      return products;
    });
  }
}
