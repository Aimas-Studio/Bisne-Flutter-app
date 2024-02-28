//Una interfaz para los GeetxControllers que le permiten tener una propiedad llamada index
import 'package:get/get.dart';

abstract class IndexButtonController extends GetxController {
  RxInt get indexButton;
  set indexButton(RxInt value);
}
