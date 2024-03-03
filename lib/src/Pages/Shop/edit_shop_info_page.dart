import 'package:bisne/src/Pages/Shop/Providers/shop_provider.dart';
import 'package:bisne/src/Pages/Shop/controllers/edit_shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/presentation/icons/custom_icons.dart';
import '../../core/presentation/themes/colors.dart';
import '../../core/presentation/widgets/buttons/custom_outline_button.dart';
import '../../core/presentation/widgets/images/circular_image.dart';
import '../../core/presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../../core/presentation/widgets/secondary_app_bar.dart';
import '../../core/presentation/widgets/texts/texts_widgets.dart';

const List<(String, IconData)> _contactInfo = [
  ("Teléfono", Icons.phone),
  ("WhatsApp", CustomIcons.whatsapp),
  ("Instagram", CustomIcons.instagram),
  ("Facebook", CustomIcons.facebook),
  ("Enlace", Icons.link),
];

class EditShopInfoPage extends StatelessWidget {
  final _form = FormGroup({});
  EditShopInfoPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: GetBuilder(
              init: EditShopController(shop: getShopInfo()),
              builder: (controller) {
                return ReactiveForm(
                  formGroup: _form,
                  child: Column(
                    children: [
                      secondaryAppBar(context, true),
                      const SizedBox(
                        height: 15,
                      ),
                      CircularImage(
                          image: AssetImage(controller.shop.imageUrl),
                          size: 65),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: OutlineAppButton(
                          child: const LightAppText(text: 'ELEGIR FOTO'),
                          onPressed: () {},
                        ),
                      ),
                      BoldAppText(text: controller.shop.shopName, size: 34),
                      RegularAppText(
                          text: controller.shop.categories.join('\n'),
                          size: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: CustomReactiveTextField(
                          formName: '',
                          labelText: "CAMBIAR DESCRIPCIÓN",
                          prefixIcon: Icons.edit,
                        ),
                      ),
                      const CustomReactiveTextField(
                          formName: '',
                          labelText: "Cambiar Horario 1",
                          prefixIcon: Icons.access_time),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomReactiveTextField(
                        formName: '',
                        labelText: "Cambiar Horario 2",
                        prefixIcon: Icons.access_time,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomReactiveTextField(
                          formName: '',
                          labelText: "Cambiar Horario 3",
                          prefixIcon: Icons.access_time),
                      Divider(
                        height: 60,
                        indent: MediaQuery.of(context).size.width * 0.1,
                        endIndent: MediaQuery.of(context).size.width * 0.1,
                      ),
                      const CustomReactiveTextField(
                          formName: '',
                          labelText: "Ubicación",
                          prefixIcon: Icons.location_on_outlined),
                      const SizedBox(
                        height: 30,
                      ),
                      // listWhiteLabelInput(context, _contactInfo),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlineAppButton(
                            child: const LightAppText(text: "GUARDAR CAMBIOS"),
                            onPressed: () {},
                          ),
                          OutlineAppButton(
                            child: const LightAppText(text: "DESCARTAR"),
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
