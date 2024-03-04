import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/decorations.dart';
import '../../../../core/presentation/widgets/buttons/custom_button_arrow_icon.dart';
import '../../../../core/presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'username': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
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
                                CustomReactiveTextField(
                                  formName: 'email',
                                  prefixIcon: Icons.email_outlined,
                                  labelText: 'E-MAIL',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CustomReactiveTextField(
                                    formName: 'email',
                                    prefixIcon: Icons.email_outlined,
                                    labelText: 'E-MAIL',
                                  ),
                                ),
                                CustomReactiveTextField(
                                  formName: 'password',
                                  prefixIcon: Icons.lock_outline,
                                  labelText: 'CONTRASEÑA',
                                  passwordFieldShowOrHide: true,
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
