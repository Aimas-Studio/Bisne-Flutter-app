import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../infrastructure/services/get_shop_info.dart';
import '../controllers/edit_or_create_shop_controller.dart';

const passwordAdvice =
    'NOTA: Debe ingresar su contraseña para guardar las modificaciones.';

class EditOrCreateShopInfoPage extends StatelessWidget {
  final bool createShop;

  const EditOrCreateShopInfoPage({
    super.key,
    this.createShop = true,
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: GetBuilder(
                id: EditOrCreateShopController.idController,
                init: EditOrCreateShopController(createShop,
                    shop: createShop ? null : getShopInfo()),
                builder: (controller) {
                  return ReactiveForm(
                    formGroup: controller.form,
                    child: Column(
                      children: [
                        // const CustomAppBar(returnButton: true),
                        const SizedBox(
                          height: 15,
                        ),
                        CircularImage(
                          shadow: controller.hasImage,
                          size: 65,
                          child: createShop
                              ? controller.hasImage
                                  ? CustomFadeInImage(
                                      image: controller.shopImage!)
                                  : addImagePlaceHolder
                              : CustomFadeInImage(image: controller.shopImage!),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: OutlineAppButton(
                            onPressed: controller.pickImage,
                            child: const LightAppText(text: 'ELEGIR FOTO'),
                          ),
                        ),
                        createShop
                            ? const DecoratedWhiteBox(
                                child: CustomReactiveTextField(
                                  formName: 'shopName',
                                  labelText: "ELEGIR NOMBRE DE LA TIENDA",
                                  prefixIcon: Icons.edit,
                                ),
                              )
                            : BoldAppText(
                                text: controller.shop!.shopName, size: 34),
                        createShop
                            ? const SizedBox(height: 15)
                            : RegularAppText(
                                text: controller.shop!.category, size: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: DecoratedWhiteBox(
                            child: CustomReactiveTextField(
                              formName: 'description',
                              labelText: "ELEGIR DESCRIPCIÓN",
                              prefixIcon: Icons.edit,
                            ),
                          ),
                        ),
                        const DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                              formName: 'schedule',
                              labelText: "ELEGIR HORARIO",
                              prefixIcon: Icons.access_time),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                          height: 60,
                          indent: MediaQuery.of(context).size.width * 0.1,
                          endIndent: MediaQuery.of(context).size.width * 0.1,
                        ),
                        const DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                              formName: 'location',
                              labelText: "UBICACIÓN",
                              prefixIcon: Icons.location_on_outlined),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const DecoratedWhiteBox(
                          child: Column(
                            children: [
                              CustomReactiveTextField(
                                formName: 'whatsAppNumber',
                                labelText: "WHATSAPP",
                                prefixIcon: CustomIcons.whatsapp,
                              ),
                              CustomReactiveTextField(
                                formName: 'instagram',
                                labelText: "INSTAGRAM",
                                prefixIcon: CustomIcons.instagram,
                              ),
                              CustomReactiveTextField(
                                formName: 'facebook',
                                labelText: "FACEBOOK",
                                prefixIcon: CustomIcons.facebook,
                              ),
                              CustomReactiveTextField(
                                formName: 'link',
                                labelText: "ENLACE",
                                prefixIcon: Icons.link,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: LightAppText(
                            text: passwordAdvice,
                            maxLines: 5,
                            align: TextAlign.center,
                          ),
                        ),
                        const DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            formName: 'password',
                            prefixIcon: CustomIcons.password,
                            passwordFieldShowOrHide: true,
                            labelText: 'CONTRASEÑA',
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReactiveFormConsumer(
                              builder: (context, formGroup, child) {
                                return OutlineAppButton(
                                  enabled:
                                      formGroup.valid && controller.hasImage,
                                  onPressed: createShop
                                      ? controller.createShopSubmit
                                      : controller.editShopSubmit,
                                  child: LightAppText(
                                      text: createShop
                                          ? 'CREAR TIENDA'
                                          : "GUARDAR CAMBIOS"),
                                );
                              },
                            ),
                            OutlineAppButton(
                              onPressed: controller.cancelEdit,
                              child: const LightAppText(text: "DESCARTAR"),
                            )
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
