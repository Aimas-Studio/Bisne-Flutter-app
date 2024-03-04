import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/decorations.dart';
import '../../../../core/presentation/widgets/buttons/custom_outline_button.dart';
import '../../../../core/presentation/widgets/inputs/white_input_text_widget.dart';
import '../../../../core/presentation/widgets/secondary_app_bar.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../domain/entities/user.dart';
import '../../infrastructure/services/user_services.dart';
import '../controllers/edit_user_controller.dart';

class EditUserPage extends StatelessWidget {
  final User user;

  const EditUserPage({super.key, required this.user});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: secondaryAppBar(context, true),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: GetBuilder(
            init: EditUserController(user: getUserInfo()),
            builder: (controller) => SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // CircularImage(image: AssetImage(user.imageUrl), size: 70),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: OutlineAppButton(
                        child: const LightAppText(text: "ELEGIR FOTO"),
                        onPressed: () {},
                      )),
                  BoldAppText(text: user.username, size: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: RegularAppText(text: user.email, size: 16),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: whiteBoxDecoration,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: WhiteInputTextWidget(
                      controller: controller.nameController,
                      labelText: "EDITAR USUARIO",
                      prefixIcon: Icons.edit,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlineAppButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: const LightAppText(text: "GUARDAR CAMBIOS"),
                      ),
                      const SizedBox(width: 10),
                      OutlineAppButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: const LightAppText(text: "DESCARTAR"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
