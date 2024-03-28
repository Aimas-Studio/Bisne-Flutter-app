import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../controllers/register_controller.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: GetBuilder(
              id: 'registerPage',
              init: RegisterController(),
              builder: (controller) {
                return ReactiveForm(
                  formGroup: controller.form,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Icon(Icons.account_circle,
                            color: fontAppColor, size: 110),
                        const SizedBox(height: 5),
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
                                  formName: 'userName',
                                  prefixIcon: Icons.email_outlined,
                                  labelText: 'USERNAME',
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
                        const SizedBox(height: 30),
                        ReactiveFormConsumer(builder: (context, form, child) {
                          return CustomButtonArrowIcon(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 60,
                            enabled: form.valid,
                            color: form.valid
                                ? buttonColor
                                : buttonColor.withOpacity(0.5),
                            onPressed: controller.registerUserSubmit,
                            text: 'INGRESAR',
                          );
                        }),
                        const SizedBox(height: 20),
                        const LightAppText(text: "¿Ya tienes una cuenta?"),
                        const SizedBox(height: 5),
                        // LightAppText(
                        //   text:
                        //       "Si es asi puedes iniciar sesión \n en nuestra app",
                        //   color: fontAppColor.withOpacity(0.5),
                        //   align: TextAlign.center,
                        // ),
                        const SizedBox(height: 10),
                        CustomLinkWidget(
                          text: 'Iniciar Sesión',
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const LoginPage(),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
