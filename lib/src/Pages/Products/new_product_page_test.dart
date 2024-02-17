import 'package:bisne/src/Pages/User/Widgets/profiles_pages_button.dart';
import 'package:bisne/src/Utils/custom_icons.dart';
import 'package:flutter/material.dart';

import '../../Utils/decorations.dart';
import '../../Utils/interfaces.dart';
import '../../Utils/texts.dart';
import '../../Widgets/image_picker_widget.dart';
import '../../Widgets/secondary_app_bar.dart';
import '../Shop/Providers/shop_provider.dart';
import '../User/Widgets/input_text_widget.dart';
import 'Widgets/product_widgets.dart';

class NewProductPageTest extends StatefulWidget {
  NewProductPageTest({super.key});

  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  @override
  State<NewProductPageTest> createState() => _NewProductPageTestState();
}

class _NewProductPageTestState extends State<NewProductPageTest> {
  List<FileImage> previewImages = [];
  final imagesPickers = [
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
  ];

  @override
  Widget build(context) {
    for (ImagePickerWidget imagePicker in imagesPickers) {
      imagePicker.updateParentState = refresh;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              secondaryAppBar(context, true),
              boldAppText("Nuevo Producto", 26),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: whiteLabelInputTextWidget(
                  context,
                  "DEFINIR NOMBRE",
                  iconData: Icons.edit,
                  controller: widget.nameController,
                  onChanged: updateTexts,
                ),
              ),
              whiteLabelInputTextWidget(
                context,
                "DEFINIR CATEGORÍA",
                iconData: Icons.edit,
                controller: widget.categoryController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 25),
                child: whiteLabelInputTextWidget(
                  context,
                  "DEFINIR DESCRIPCIÓN",
                  iconData: Icons.edit,
                  controller: widget.descriptionController,
                  onChanged: updateTexts,
                ),
              ),
              whiteLabelInputTextWidget(
                context,
                "DEFINIR PRECIO",
                iconData: Icons.edit,
                controller: widget.priceController,
                onChanged: updateTexts,
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
                          margin: const EdgeInsets.only(left: 25, right: 10),
                          child: const Icon(Icons.add_photo_alternate_outlined),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            inputText("IMÁGENES"),
                            regularAppText("Selecciona hasta 5 imágenes", 13),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              boldAppText("Previsualización", 28),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: whiteBoxDecoration,
                child: Column(
                  children: [
                    productSwiper(
                      context,
                      previewImages,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        regularAppText(getShopInfo().shopName, 19),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child:
                              boldAppText(widget.nameController.value.text, 25),
                        ),
                        lightAppText(
                          widget.descriptionController.value.text,
                          15,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            boldAppText(
                                widget.priceController.value.text == ""
                                    ? "\$\$"
                                    : widget.priceController.value.text,
                                20),
                            regularAppText("mn", 18),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
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
