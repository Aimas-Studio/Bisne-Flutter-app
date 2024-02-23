import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Pages/auth/controllers/register_controller.dart';
import 'package:bisne/src/Pages/auth/widgets/custom_button_arrow_icon.dart';
import 'package:bisne/src/core/Utils/decorations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/utils/interfaces.dart';
import '../../core/utils/texts.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: _form,
            child: GetBuilder(
                id: 'registerPage',
                init: RegisterController(),
                builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        const Icon(Icons.account_circle,
                            color: fontAppColor, size: 110),
                        const SizedBox(height: 30),
                        const BoldAppText(text: "Registrarse", size: 30),
                        const SizedBox(height: 15),
                        Container(
                          decoration: whiteBoxDecoration,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                WhiteLabelInputText(
                                  formName: 'email',
                                  prefixIcon: Icons.email_outlined,
                                  labelText: 'E-MAIL',
                                  cursorColor: bisneColorPrimary,
                                ),
                                SizedBox(height: 5),
                                WhiteLabelInputText(
                                  formName: 'password',
                                  prefixIcon: Icons.lock_outline,
                                  labelText: 'CONTRASEÑA',
                                  passwordFieldShowOrHide: true,
                                  cursorColor: bisneColorPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ReactiveFormConsumer(builder: (context, form, child) {
                          return CustomButtonArrowIcon(
                            width: MediaQuery.of(context).size.width * 0.5,
                            enabled: form.valid,
                            color: form.valid
                                ? fontAppColor
                                : fontAppColor.withOpacity(0.5),
                            onPressed: () {
                              form.unfocus();
                            },
                            child: defaultButtonChild,
                          );
                        }),
                        const SizedBox(height: 35),
                        const LightAppText(text: "¿Ya tienes una cuenta?"),
                        const SizedBox(height: 5),
                        LightAppText(
                          text:
                              "Si es asi puedes iniciar sesión \n en nuestra app",
                          color: fontAppColor.withOpacity(0.5),
                          align: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
