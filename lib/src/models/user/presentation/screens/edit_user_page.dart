import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../infrastructure/services/user_services.dart';
import '../controllers/edit_user_controller.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: GetBuilder(
            id: EditUserController.idController,
            init: EditUserController(),
            builder: (controller) => SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CircularImage(
                    shadow: controller.hasImage,
                    child: controller.hasImage
                        ? CustomFadeInImage(
                            image: NetworkImage(data.userImageUrl),
                          )
                        : userPlaceHolder,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: OutlineAppButton(
                        onPressed: controller.pickImage,
                        child: const LightAppText(text: "ELEGIR FOTO"),
                      )),
                  BoldAppText(text: data.userName, size: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: RegularAppText(text: data.userEmail, size: 16),
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
                        onPressed: () => controller.editUserSubmit(),
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
