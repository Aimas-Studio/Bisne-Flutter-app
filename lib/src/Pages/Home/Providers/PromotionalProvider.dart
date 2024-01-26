import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _PromoProvider {
  List<dynamic> promoImages = [];
  bool _hasCharged = false;

  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/promo.json');
    Map dataMap = json.decode(respuesta);
    if (!_hasCharged) {
      promoImages = dataMap["images"];
      _hasCharged = true;
    }
    return promoImages;
  }
}

final PromoProvider = _PromoProvider();
