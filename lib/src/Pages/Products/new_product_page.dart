import 'package:bisne/src/Pages/Products/Controller/new_product_page_controller.dart';
import 'package:bisne/src/Pages/Products/Widgets/product_widgets.dart';
import 'package:bisne/src/Pages/Shop/Providers/shop_provider.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/decorations.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/image_picker_widget.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

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
                  context,
                  "DEFINIR NOMBRE",
                  iconData: Icons.edit,
                  controller:
                      Get.find<NewProductPageController>().nameController.value,
                ),
              ),
              whiteLabelInputTextWidget(
                context,
                "DEFINIR CATEGORÍA",
                iconData: Icons.edit,
                controller: Get.find<NewProductPageController>()
                    .categoryController
                    .value,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 25),
                child: whiteLabelInputTextWidget(
                  context,
                  "DEFINIR DESCRIPCIÓN",
                  iconData: Icons.edit,
                  controller: Get.find<NewProductPageController>()
                      .descriptionController
                      .value,
                ),
              ),
              whiteLabelInputTextWidget(
                context,
                "DEFINIR PRECIO",
                iconData: Icons.edit,
                controller:
                    Get.find<NewProductPageController>().priceController.value,
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
                              Get.find<NewProductPageController>()
                                  .imagesPickers[0],
                              const SizedBox(height: 10),
                              Get.find<NewProductPageController>()
                                  .imagesPickers[1],
                            ],
                          ),
                          Column(
                            children: [
                              Get.find<NewProductPageController>()
                                  .imagesPickers[2],
                              const SizedBox(height: 10),
                              Get.find<NewProductPageController>()
                                  .imagesPickers[3],
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Get.find<NewProductPageController>()
                                  .imagesPickers[4],
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
                child: Obx(
                  () => Column(
                    children: [
                      productSwiper(
                        context,
                        getImagesPath(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularAppText(getShopInfo().shopName, 19),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            child: boldAppText(
                                Get.find<NewProductPageController>()
                                    .nameController
                                    .value
                                    .text,
                                25),
                          ),
                          lightAppText(
                              Get.find<NewProductPageController>()
                                  .descriptionController
                                  .value
                                  .text,
                              15),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              boldAppText(
                                  Get.find<NewProductPageController>()
                                              .priceController
                                              .value
                                              .text ==
                                          ""
                                      ? "\$\$"
                                      : Get.find<NewProductPageController>()
                                          .priceController
                                          .value
                                          .text,
                                  20),
                              regularAppText("mn", 18),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<FileImage> getImagesPath() {
    List<FileImage> imagesPath = [];
    for (ImagePickerWidget fileImages
        in Get.find<NewProductPageController>().imagesPickers) {
      if (fileImages.image != null) {
        imagesPath.add(FileImage(fileImages.image!));
      }
    }
    return imagesPath;
  }
}
