import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/themes/decorations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/widgets/buttons/custom_button_arrow_icon.dart';
import '../../../../core/presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(4)]),
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: _form,
            child: GetBuilder(
                id: 'loginPage',
                init: LoginController(),
                builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        const Icon(Icons.account_circle,
                            color: fontAppColor, size: 110),
                        const SizedBox(height: 30),
                        const BoldAppText(text: "Iniciar Sesión", size: 30),
                        const SizedBox(height: 15),
                        Container(
                          decoration: whiteBoxDecoration,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14, right: 15),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                CustomReactiveTextField(
                                  formName: 'email',
                                  prefixIcon: Icons.email_outlined,
                                  labelText: 'E-MAIL',
                                  enabled: controller.enableTextFields,
                                  cursorColor: bisneColorPrimary,
                                ),
                                const SizedBox(height: 5),
                                CustomReactiveTextField(
                                  formName: 'password',
                                  prefixIcon: CustomIcons.password,
                                  labelText: 'CONTRASEÑA',
                                  passwordFieldShowOrHide: true,
                                  enabled: controller.enableTextFields,
                                  cursorColor: bisneColorPrimary,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                          return CustomButtonArrowIcon(
                            width: MediaQuery.of(context).size.width * 0.5,
                            onPressed: () {
                              controller.submitLogin();
                              _form.unfocus();
                            },
                            enabled: formGroup.valid,
                            color: formGroup.valid
                                ? buttonColor
                                : buttonColor.withOpacity(0.5),
                            child: defaultButtonChild,
                          );
                        }),
                        const SizedBox(height: 35),
                        const LightAppText(text: "¿Aún no tienes una cuenta?"),
                        const SizedBox(height: 5),
                        LightAppText(
                          text:
                              "Créala hoy mismo de manera rápida \n y disfruta de las ventajas",
                          color: fontAppColor.withOpacity(0.5),
                          align: TextAlign.center,
                        ),
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