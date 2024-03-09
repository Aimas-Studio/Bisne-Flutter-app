import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/decorations.dart';
import '../../../../core/presentation/widgets/buttons/custom_button_arrow_icon.dart';
import '../../../../core/presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 90),
                SvgPicture.asset('assets/icons/user.svg'),
                const SizedBox(height: 20),
                const BoldAppText(text: "Recuperar Contraseña", size: 35),
                const SizedBox(height: 15),
                const LightAppText(text: "¿Has olvidado tu contraseña?"),
                const SizedBox(height: 5),
                const LightAppText(
                  text:
                      " ¿Has olvidado tu contraseña? \n No te preocupes, escribe el correo electrónico \n "
                      "con el que te registraste y tu nombre de usuario. \n Te enviaremos un E-mail con tu contraseña \n "
                      "para que puedas recuperarla.",
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: whiteBoxDecoration,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        CustomReactiveTextField(
                          formName: 'email',
                          prefixIcon: Icons.email_outlined,
                          labelText: 'E-MAIL',
                          enabled: true,
                          cursorColor: bisneColorPrimary,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return CustomButtonArrowIcon(
                      color: form.valid
                          ? buttonColor
                          : buttonColor.withOpacity(0.5),
                      enabled: form.valid,
                      width: MediaQuery.of(context).size.width * 0.45,
                      onPressed: () {},
                      text: 'ENVIAR',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
