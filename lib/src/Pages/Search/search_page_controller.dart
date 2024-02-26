import 'dart:async';

import 'package:get/get.dart';

class SearchPageController extends GetxController {
  SearchPageController();
  final _streamController = StreamController<int>();
  var selectedIndex = 0.obs;

  var category = ''.obs;
  var province = ''.obs;
  var municipality = ''.obs;
  var currencyType = ''.obs;

  List<String> categories = [
    'Todas',
    'Compra y Venta',
    'Belleza',
    'Ropa y Accesorios',
    'Electrónicos',
    'Transporte',
    'Vivienda',
    'Diseño y publicidad',
    'Eventos'
  ];
  List<String> provinces = [
    'Todas',
    'La Habana',
    'Pinar del Río',
    'Matanzas',
    'Cienfuegos',
    'Holguín',
  ];
  List<String> municipalities = [
    'Todos',
    'Playa',
    'Marianao',
    'La Lisa',
    'Vedado',
    'Regla',
  ];
  List<String> currencyTypes = [
    'USD',
    'CUP',
    'MLC',
  ];

  @override
  void onInit() {
    super.onInit();
    selectedIndex.listen((index) {
      _streamController.add(index);
    });
  }

  Stream<int> get indexStream => _streamController.stream;

  @override
  void onClose() {
    super.onClose();
    _streamController.close();
  }

  List<String> getListProperty(property) {
    switch (property) {
      case 'provinces':
        return provinces;
      case 'municipalities':
        return municipalities;
      case 'currencyTypes':
        return currencyTypes;
      case 'categories':
        return categories;
      default:
        return [];
    }
  }

  RxString getProperty(property) {
    switch (property) {
      case 'provinces':
        return province;
      case 'municipalities':
        return municipality;
      case 'currencyTypes':
        return currencyType;
      case 'categories':
        return category;
      default:
        return ''.obs;
    }
  }
}
