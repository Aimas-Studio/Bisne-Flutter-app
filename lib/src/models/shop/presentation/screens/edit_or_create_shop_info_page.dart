import 'package:bisne/src/core/domain/regions/regions.dart';
import 'package:bisne/src/core/presentation/widgets/inputs/custom_reactive_drop_down_field.dart';
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
        appBar: CustomAppBar(),
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
                                  formName: 'name',
                                  labelText: "ELEGIR NOMBRE DE LA TIENDA",
                                  prefixIcon: Icons.edit,
                                ),
                              )
                            : BoldAppText(
                                text: controller.shop!.name, size: 34),
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
                        DecoratedWhiteBox(
                          child: CustomReactiveDropDownField(
                            labelText: 'Provincia',
                            enabled: true,
                            formName: 'region',
                            items: getRegion(),
                            onChange: (_) {
                              controller.updateController();
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        DecoratedWhiteBox(
                          child: CustomReactiveDropDownField(
                              labelText: 'Municipio',
                              enabled: controller.isRegionSelected,
                              formName: 'municipality',
                              items: controller.isRegionSelected
                                  ? getMunicipality(
                                      controller.form.control('region').value)
                                  : []),
                        ),
                        const SizedBox(height: 30),
                        const DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                              formName: 'location',
                              labelText: "UBICACIÓN",
                              prefixIcon: Icons.location_on_outlined),
                        ),
                        const SizedBox(height: 30),
                        const DecoratedWhiteBox(
                          child: Padding(
                            padding: EdgeInsets.only(left: 4),
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

List<DropdownMenuItem> getRegion() {
  List<DropdownMenuItem> items = [];
  for (var region in regions.keys) {
    items.add(DropdownMenuItem(
      value: region,
      child: InputLightText(
        text: region,
        size: 14,
      ),
    ));
  }
  return items;
}

List<DropdownMenuItem> getMunicipality(String region) {
  return regions[region]!.map((municipality) {
    return DropdownMenuItem(
      value: municipality,
      child: InputLightText(
        text: municipality,
        size: 14,
      ),
    );
  }).toList();
}
