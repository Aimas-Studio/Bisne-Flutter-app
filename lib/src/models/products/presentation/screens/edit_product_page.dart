import 'package:bisne/src/core/domain/entities/categories/categories.dart';
import 'package:bisne/src/core/presentation/icons/custom_icons.dart';
import 'package:bisne/src/core/presentation/themes/themes_export.dart';
import 'package:bisne/src/core/presentation/widgets/inputs/custom_reactive_drop_down_field.dart';
import 'package:bisne/src/core/utils/drop_down_menu_item_from_values.dart';
import 'package:bisne/src/models/products/presentation/controllers/edit_product_page_controller.dart';
import 'package:bisne/src/models/products/presentation/widgets/preview_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../export.dart';

class EditProductPage extends StatelessWidget {
  final Product product;

  const EditProductPage({super.key, required this.product});
  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: GetBuilder(
            id: EditProductPageController.idController,
            init: EditProductPageController(product: product),
            builder: (controller) => ReactiveForm(
              formGroup: controller.form,
              child: Column(
                children: [
                  const BoldAppText(text: 'Editar Producto', size: 30),
                  ReactiveFormConsumer(
                      builder: (context, FormGroup formGroup, Widget? child) {
                    return PreviewProductWidget(
                      productName: controller.productName,
                      productDescription: controller.productDescription,
                      productCategory: controller.productCategory,
                      price: controller.productPrice,
                      productImage: controller.hasImageChange
                          ? controller.productImage
                          : NetworkImage(product.imageUrl),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: DecoratedWhiteBox(
                              child: CustomReactiveTextField(
                                  prefixIcon: Icons.edit,
                                  labelText: 'CAMBIAR NOMBRE',
                                  formName: 'productName')),
                        ),
                        DecoratedWhiteBox(
                          child: CustomReactiveDropDownField(
                              labelText: 'CAMBIAR CATEGORÍA',
                              items: getItems(categories.keys.toList()),
                              formName: 'productCategory'),
                        ),
                        const SizedBox(height: 30),
                        const DecoratedWhiteBox(
                            child: CustomReactiveTextField(
                                prefixIcon: Icons.edit,
                                labelText: 'CAMBIAR ETIQUETA',
                                formName: 'label')),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: DecoratedWhiteBox(
                            child: CustomReactiveTextField(
                                prefixIcon: Icons.edit,
                                labelText: 'CAMBIAR DESCRIPCIÓN',
                                formName: 'productDescription'),
                          ),
                        ),
                        const DecoratedWhiteBox(
                            child: CustomReactiveTextField(
                                prefixIcon: Icons.edit,
                                labelText: 'CAMBIAR PRECIO',
                                formName: 'productPrice')),
                        Column(
                          children: [
                            const SizedBox(height: 60),
                            DecoratedWhiteBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 40, top: 10, right: 10, left: 10),
                                child: Column(
                                  children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                            Icons.add_photo_alternate_outlined),
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
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 100),
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
                                      onPressed: controller.editProductSubmit,
                                      child: const LightAppText(
                                          text: 'GUARDAR CAMBIOS'),
                                    );
                                  },
                                ),
                                OutlineAppButton(
                                  onPressed: () {
                                    controller.form.value.clear();
                                    Get.back();
                                  },
                                  child: const LightAppText(text: 'Cancelar'),
                                )
                              ],
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ],
                    ),
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
