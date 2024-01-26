import 'package:get/get.dart';

class BasePageController extends GetxController {
  BasePageController();

  final _obj = 2.obs;
  set obj(value) {
    update();
    this._obj.value = value;
  }

  get obj => this._obj.value;
}
