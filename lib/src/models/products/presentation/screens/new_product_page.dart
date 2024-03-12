import 'package:bisne/src/core/presentation/themes/decorations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../controllers/new_product_page_controller.dart';
import '../widgets/preview_product_widget.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: CustomAppBar(),
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
                  formGroup: controller.form,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            formName: 'productName',
                            labelText: 'DEFINIR NOMBRE',
                            prefixIcon: Icons.edit,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            formName: 'categoryProduct',
                            labelText: 'DEFINIR CATEGORÍA',
                            prefixIcon: Icons.edit,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            formName: 'descriptionProduct',
                            labelText: 'DEFINIR DESCRIPCIÓN',
                            prefixIcon: Icons.edit,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            formName: 'priceProduct',
                            labelText: 'DEFINIR PRECIO',
                            prefixIcon: Icons.edit,
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: DecoratedWhiteBox(
                          paddingVertical: 10,
                          paddingHorizontal: 20,
                          child: Column(
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_photo_alternate_outlined),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LightAppText(
                                        text: 'IMÁGENES',
                                        size: 13,
                                      ),
                                      RegularAppText(
                                          text: 'Selecciona una imagen'),
                                    ],
                                  )
                                ],
                              ),
                              ImagePicker(
                                onTap: controller.pickImage,
                                image: controller.productImage,
                              ),
                            ],
                          ),
                        ),
                      ),
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
                                enabled: controller.form.valid,
                                onPressed: controller.createProduct,
                                child:
                                    const LightAppText(text: 'GUARDAR CAMBIOS'),
                              );
                            },
                          ),
                          OutlineAppButton(
                            onPressed: () {
                              controller.form.value.clear();
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
