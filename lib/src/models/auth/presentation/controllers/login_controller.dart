import 'package:get/get.dart';

class LoginController extends GetxController {
  bool loading = false;
  bool enableTextFields = true;

  void submitLogin() async {
    loading = true;
    update(['loginPage']);
  }
}
