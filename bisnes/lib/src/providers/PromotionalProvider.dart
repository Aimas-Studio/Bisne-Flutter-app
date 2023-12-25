import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _PromoProvider {
  List<dynamic> promoImages = ['assets/fotos/hero.png'];

  _PromoProvider() {}

  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/promo.json');
    Map dataMap = json.decode(respuesta);
    promoImages = dataMap["images"];
    return promoImages;
  }
}

final PromoProvider = new _PromoProvider();
