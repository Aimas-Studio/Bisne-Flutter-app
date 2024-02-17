import 'package:bisne/src/Pages/Products/Widgets/product_widgets.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/decorations.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

import '../../Utils/custom_icons.dart';
import '../../Widgets/image_picker_widget.dart';
import '../User/Widgets/profiles_pages_button.dart';

class EditProductPage extends StatefulWidget {
  final ProductDump productDump;

  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  List<ImageProvider> images = [];

  EditProductPage({required this.productDump, super.key}) {
    nameController = TextEditingController(text: productDump.name);
    categoryController = TextEditingController();
    descriptionController =
        TextEditingController(text: productDump.description);
    priceController = TextEditingController(text: productDump.price.toString());
    categoryController = TextEditingController(text: productDump.category);
    getImages();
  }

  void getImages() {
    images.clear();
    for (String url in productDump.imagesUrl) {
      images.add(NetworkImage(url));
    }
  }

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  List<ImagePickerWidget> imagesPickers = [];
  List<FileImage> previewImages = [];

  _EditProductPageState() {
    imagesPickers.clear();
    for (int i = 0; i < 5; i++) {
      if (i < widget.images.length) {
        imagesPickers.add(
          ImagePickerWidget(
            defaultImage: widget.images[i],
            updateParentState: refresh,
          ),
        );
      } else {
        imagesPickers.add(
          ImagePickerWidget(
            updateParentState: refresh,
          ),
        );
      }
    }
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              secondaryAppBar(context, true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: boldAppText("Editar Producto", 26),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: whiteBoxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productSwiper(context, widget.images),
                        const SizedBox(height: 20),
                        regularAppText(
                          widget.productDump.shopDump.shopName,
                          16,
                        ),
                        boldAppText(widget.nameController.value.text, 24),
                        const SizedBox(height: 15),
                        lightAppText(
                          widget.descriptionController.value.text,
                          15,
                        ),
                        Row(
                          children: [
                            boldAppText(widget.priceController.value.text, 20),
                            regularAppText("mn", 18),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      whiteLabelInputTextWidget(
                        context,
                        "CAMBIAR NOMBRE",
                        iconData: Icons.edit,
                        controller: widget.nameController,
                        onChanged: updateTexts,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        child: whiteLabelInputTextWidget(
                          context,
                          "CAMBIAR CATEGORÍA",
                          iconData: Icons.edit,
                          controller: widget.categoryController,
                          onChanged: updateTexts,
                        ),
                      ),
                      whiteLabelInputTextWidget(
                        context,
                        "CAMBIAR DESCRIPCIÓN",
                        iconData: Icons.edit,
                        controller: widget.descriptionController,
                        onChanged: updateTexts,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        child: whiteLabelInputTextWidget(
                          context,
                          "CAMBIAR PRECIO",
                          iconData: Icons.edit,
                          controller: widget.priceController,
                          onChanged: updateTexts,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 60),
                        width: MediaQuery.of(context).size.width * 0.83,
                        decoration: whiteBoxDecoration,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 25, right: 10),
                                  child: const Icon(
                                      Icons.add_photo_alternate_outlined),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    inputText("IMÁGENES"),
                                    regularAppText(
                                        "Selecciona hasta 5 imágenes", 13),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      imagesPickers[0],
                                      const SizedBox(height: 10),
                                      imagesPickers[1],
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      imagesPickers[2],
                                      const SizedBox(height: 10),
                                      imagesPickers[3],
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      imagesPickers[4],
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 25),
                        child: lightAppText(
                          "Nota : Debe ingresar su contraseña para guardar las modificaciones",
                          14,
                        ),
                      ),
                      whiteLabelInputTextWidget(
                        context,
                        "Contraseña",
                        iconData: CustomIcons.password,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            profilesPageButton("CREAR PRODUCTO", () {}),
                            profilesPageButton("CANCELAR", () {}),
                          ],
                        ),
                      ),
                      const SizedBox(height: 45),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<FileImage> getImagesPath() {
    List<FileImage> imagesPath = [];
    for (ImagePickerWidget fileImages in imagesPickers) {
      if (fileImages.image != null) {
        imagesPath.add(FileImage(fileImages.image!));
      }
    }
    return imagesPath;
  }

  void updateTexts(String s) {
    setState(() {});
  }

  void refresh() {
    setState(() {
      previewImages = getImagesPath();
    });
  }
}
