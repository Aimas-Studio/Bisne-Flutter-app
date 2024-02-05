import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePageController extends GetxController {
  BasePageController();

  final _obj = 2.obs;
  set obj(value) {
    // update();
    _obj.value = value;
  }

  get obj => _obj.value;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
}
