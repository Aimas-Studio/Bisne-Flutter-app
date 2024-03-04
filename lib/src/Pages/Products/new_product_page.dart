import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/presentation/icons/custom_icons.dart';
import '../../core/presentation/themes/colors.dart';
import '../../core/presentation/widgets/buttons/custom_outline_button.dart';
import '../../core/presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../../core/presentation/widgets/texts/texts_widgets.dart';
import 'controllers/new_product_page_controller.dart';
import 'widgets/preview_product_widget.dart';

class NewProductPage extends StatelessWidget {
  NewProductPage({super.key});

  final form = FormGroup({
    'productName': FormControl<String>(validators: [Validators.required]),
    'categoryProduct': FormControl<String>(validators: [Validators.required]),
    'descriptionProduct':
        FormControl<String>(validators: [Validators.required]),
    'priceProduct': FormControl<double>(
        validators: [Validators.required, Validators.number]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: BoldAppText(text: 'Nuevo Producto', size: 30),
              ),
              GetBuilder(
                id: NewProductPageController.idController,
                init: NewProductPageController(),
                builder: (controller) => ReactiveForm(
                  formGroup: form,
                  child: Column(
                    children: [
                      const CustomReactiveTextField(
                        formName: 'productName',
                        labelText: 'DEFINIR NOMBRE',
                        prefixIcon: Icons.edit,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: CustomReactiveTextField(
                            formName: 'categoryProduct',
                            labelText: 'DEFINIR CATEGORÍA'),
                      ),
                      const CustomReactiveTextField(
                        formName: 'descriptionProduct',
                        labelText: 'DEFINIR DESCRIPCIÓN',
                        prefixIcon: Icons.edit,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: CustomReactiveTextField(
                          formName: 'priceProduct',
                          labelText: 'DEFINIR PRECIO',
                          prefixIcon: Icons.edit,
                        ),
                      ),
                      //
                      //ImagesPicker
                      //
                      const Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 15),
                        child: BoldAppText(text: 'Previsualización', size: 27),
                      ),
                      const PreviewProductWidget(),
                      const SizedBox(height: 50),
                      const LightAppText(
                        text:
                            "NOTA: Debe ingresar su contraseña para guardar las modificaciones",
                        size: 14,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 50),
                        child: CustomReactiveTextField(
                          formName: 'password',
                          prefixIcon: CustomIcons.password,
                          passwordFieldShowOrHide: true,
                        ),
                      ),
                      Row(
                        children: [
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return OutlineAppButton(
                                enabled: form.valid,
                                onPressed: controller.createProduct,
                                child:
                                    const LightAppText(text: 'GUARDAR CAMBIOS'),
                              );
                            },
                          ),
                          OutlineAppButton(
                            onPressed: () {
                              form.value.clear();
                            },
                            child: const LightAppText(text: 'Cancelar'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
