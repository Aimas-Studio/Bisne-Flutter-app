import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/dtos/register_user_dto.dart';
import '../../infrastructure/services/register_user.dart';

class RegisterController extends GetxController {
  final form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'userName': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
  });

  registerUserSubmit() async {
    // form.unfocus();

    final RegisterUserDto userDto = RegisterUserDto(
      email: form.control('email').value,
      userName: form.control('userName').value,
      password: form.control('password').value,
    );

    if (await registerUser(userDto)) {
      Get.showSnackbar(GetSnackBar(
          message: 'Se ha registrado el Usuario',
          duration: Duration(seconds: 2)));
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Error',
        duration: Duration(seconds: 2),
      ));
    }
  }
}
