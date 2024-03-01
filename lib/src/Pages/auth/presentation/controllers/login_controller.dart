import 'package:get/get.dart';

import '../../infrastructure/services/auth_services.dart';

class LoginController extends GetxController {
  bool loading = false;
  bool enableTextFields = true;

  void submitLogin() async {
    loading = true;
    update(['loginPage']);
    await login();
  }
}
