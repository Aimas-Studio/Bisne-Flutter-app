// import 'package:bisne/src/core/widgets/buttons/custom_outline_button.dart';
// import 'package:flutter/material.dart';
//
// import '../../core/utils/colors.dart';
// import '../../core/utils/decorations.dart';
// import '../../core/widgets/images/image_picker_widget.dart';
// import '../../core/widgets/custom_reactive_text_field.dart';
// import '../../core/widgets/secondary_app_bar.dart';
// import '../../core/widgets/texts/texts_widgets.dart';
// import '../Shop/Providers/shop_provider.dart';
// import 'Widgets/product_widgets.dart';
//
// //TODO fix this shit
//
// class NewProductPageTest extends StatefulWidget {
//   NewProductPageTest({super.key});
//
//   final _nameController = TextEditingController();
//   final _categoryController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   State<NewProductPageTest> createState() => _NewProductPageTestState();
// }
//
// class _NewProductPageTestState extends State<NewProductPageTest> {
//   List<FileImage> _previewImages = [];
//   final _imagesPickers = [
//     ImagePickerWidget(),
//     ImagePickerWidget(),
//     ImagePickerWidget(),
//     ImagePickerWidget(),
//     ImagePickerWidget(),
//   ];
//
//   @override
//   Widget build(context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backgroundAppColor,
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               secondaryAppBar(context, true),
//               const BoldAppText(text: "Nuevo Producto", size: 26),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 15),
//                 child: whiteLabelInputTextWidget(
//                   context,
//                   "DEFINIR NOMBRE",
//                   iconData: Icons.edit,
//                   controller: widget._nameController,
//                   onChanged: updateTexts,
//                 ),
//               ),
//               whiteLabelInputTextWidget(
//                 context,
//                 "DEFINIR CATEGORÍA",
//                 iconData: Icons.edit,
//                 controller: widget._categoryController,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15, bottom: 25),
//                 child: whiteLabelInputTextWidget(
//                   context,
//                   "DEFINIR DESCRIPCIÓN",
//                   iconData: Icons.edit,
//                   controller: widget._descriptionController,
//                   onChanged: updateTexts,
//                 ),
//               ),
//               whiteLabelInputTextWidget(
//                 context,
//                 "DEFINIR PRECIO",
//                 iconData: Icons.edit,
//                 controller: widget._priceController,
//                 onChanged: updateTexts,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 40, bottom: 60),
//                 width: MediaQuery.of(context).size.width * 0.83,
//                 decoration: whiteBoxDecoration,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(left: 25, right: 10),
//                           child: const Icon(Icons.add_photo_alternate_outlined),
//                         ),
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             InputLightText(text: "IMÁGENES"),
//                             RegularAppText(
//                                 text: "Selecciona hasta 5 imágenes", size: 13),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 20, bottom: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               _imagesPickers[0],
//                               const SizedBox(height: 10),
//                               _imagesPickers[1],
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               _imagesPickers[2],
//                               const SizedBox(height: 10),
//                               _imagesPickers[3],
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               _imagesPickers[4],
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//               const BoldAppText(text: "Previsualización", size: 28),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                 decoration: whiteBoxDecoration,
//                 child: Column(
//                   children: [
//                     productSwiper(
//                       context,
//                       _previewImages,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RegularAppText(text: getShopInfo().shopName, size: 19),
//                         Container(
//                           margin: const EdgeInsets.only(top: 10, bottom: 20),
//                           child: BoldAppText(
//                               text: widget._nameController.value.text,
//                               size: 25),
//                         ),
//                         LightAppText(
//                           text: widget._descriptionController.value.text,
//                           size: 15,
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             BoldAppText(
//                                 text: widget._priceController.value.text == ""
//                                     ? "\$\$"
//                                     : widget._priceController.value.text,
//                                 size: 20),
//                             const RegularAppText(text: "mn", size: 18),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
//                 child: LightAppText(
//                   text:
//                       "Nota : Debe ingresar su contraseña para guardar las modificaciones",
//                   size: 14,
//                 ),
//               ),
//               passwordInputText(
//                 context,
//                 controller: widget._passwordController,
//                 onChange: updateTexts,
//               ),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     OutlineAppButton(
//                       onPressed: () {},
//                       child: const LightAppText(text: "CREAR PRODUCTO"),
//                     ),
//                     OutlineAppButton(
//                       child: const LightAppText(text: "CANCELAR"),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 45),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<FileImage> getImagesPath() {
//     List<FileImage> imagesPath = [];
//     for (ImagePickerWidget fileImages in _imagesPickers) {
//       if (fileImages.image != null) {
//         imagesPath.add(FileImage(fileImages.image!));
//       }
//     }
//     return imagesPath;
//   }
//
//   void updateTexts(String s) {
//     setState(() {});
//   }
//
//   void refresh() {
//     setState(() {
//       _previewImages = getImagesPath();
//     });
//   }
// }
