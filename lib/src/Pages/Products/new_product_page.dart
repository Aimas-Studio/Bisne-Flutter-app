import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/decorations.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

import '../../Widgets/image_picker_widget.dart';

class NewProductPage extends StatelessWidget {
  NewProductPage({super.key});
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(context) {
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
                    context, "DEFINIR NOMBRE", Icons.edit),
              ),
              whiteLabelInputTextWidget(
                  context, "DEFINIR CATEGORÍA", Icons.edit),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 25),
                child: whiteLabelInputTextWidget(
                    context, "DEFINIR DESCRIPCIÓN", Icons.edit),
              ),
              whiteLabelInputTextWidget(context, "DEFINIR PRECIO", Icons.edit),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              ImagePickerWidget(),
                              SizedBox(height: 10),
                              ImagePickerWidget(),
                            ],
                          ),
                          Column(
                            children: [
                              ImagePickerWidget(),
                              SizedBox(height: 10),
                              ImagePickerWidget(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImagePickerWidget(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              boldAppText("Previsualización", 28),
            ],
          ),
        ),
      ),
    );
  }
}
