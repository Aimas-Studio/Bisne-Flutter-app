import 'package:bisne/src/models/auth/domain/dtos/login_dto.dart';
import 'package:bisne/src/models/auth/infrastructure/services/login_user.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../base/presentation/controllers/base_page_controller.dart';

class LoginController extends GetxController {
  bool loading = false;
  bool enableTextFields = true;

  final form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
  });

  submitLogin() async {
    loading = true;

    final LoginDto userDto = LoginDto(
      email: form.control('email').value,
      password: form.control('password').value,
    );

    if (await loginUser(userDto)) {
      Get.showSnackbar(const GetSnackBar(
          message: 'Se ha podido logear', duration: Duration(seconds: 2)));
      if (await isAdminUser()) {
        if (await getShop()) {}
      }
      final baseController = Get.find<BasePageController>();
      final homeController = Get.find<HomePageController>();
      homeController.setLogin();
      baseController.obj = 2;
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: 'Error',
        duration: Duration(seconds: 2),
      ));
    }
  }
}
