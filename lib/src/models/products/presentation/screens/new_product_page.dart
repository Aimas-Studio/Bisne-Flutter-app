import 'package:bisne/src/core/domain/entities/categories/categories.dart';
import 'package:bisne/src/core/presentation/themes/decorations.dart';
import 'package:bisne/src/core/presentation/widgets/inputs/custom_reactive_drop_down_field.dart';
import 'package:bisne/src/core/utils/drop_down_menu_item_from_values.dart';
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveDropDownField(
                            items: getItems(categories),
                            formName: 'categoryProduct',
                            labelText: 'DEFINIR CATEGORÍA',
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
                              const SizedBox(height: 10),
                              ImagePicker(
                                onTap: controller.pickImage,
                                image: controller.productImage,
                              ),
                              const SizedBox(height: 20),
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
                      ReactiveFormConsumer(builder: (BuildContext context,
                          FormGroup formGroup, Widget? child) {
                        return PreviewProductWidget(
                          productName:
                              controller.form.control('productName').value ??
                                  '',
                          productCategory: controller.form
                                  .control('categoryProduct')
                                  .value ??
                              '',
                          productDescription: controller.form
                                  .control('descriptionProduct')
                                  .value ??
                              '',
                          price:
                              controller.form.control('priceProduct').value ??
                                  '',
                          productImage: controller.productImage,
                        );
                      }),
                      const SizedBox(height: 50),
                      const LightAppText(
                        align: TextAlign.center,
                        text:
                            "NOTA: Debe ingresar su contraseña para guardar las modificaciones",
                        size: 14,
                        maxLines: 3,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 50, right: 30, left: 30),
                        child: DecoratedWhiteBox(
                          child: CustomReactiveTextField(
                            labelText: 'CONTRASEÑA',
                            formName: 'password',
                            prefixIcon: CustomIcons.password,
                            passwordFieldShowOrHide: true,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      const SizedBox(height: 100),
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
