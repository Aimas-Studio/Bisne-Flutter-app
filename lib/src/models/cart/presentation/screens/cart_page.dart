import 'package:bisne/src/core/presentation/themes/decorations.dart';
import 'package:bisne/src/models/cart/presentation/widgets/buy_info_widget.dart';
import 'package:bisne/src/models/cart/presentation/widgets/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../products/export.dart';
import '../controllers/cart_page_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: CartController.idController,
      init: CartController(),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: backgroundAppColor,
        body: Column(children: [
          //PRODUCTS
          //
          ListView(children: getProductsCartWidget(controller.itemsToBuy)),
          const BoldAppText(text: 'Datos Requeridos'),
          const SizedBox(height: 20),
          DecoratedWhiteBox(
            child: Column(
              children: [
                WhiteInputTextWidget(
                  controller: controller.textPhoneNumberController,
                  labelText: 'TÉLEFONO',
                  prefixIcon: Icons.phone,
                ),
                WhiteInputTextWidget(
                  labelText: 'NOMBRE',
                  controller: controller.textUserNameController,
                  prefixIcon: Icons.person,
                ),
                WhiteInputTextWidget(
                  controller: controller.textAddressController,
                  prefixIcon: CustomIcons.truck,
                  labelText: '¿DESEA MENSAJERÍA?',
                  hintText: 'Ej: sí, para 74/21 y 23, Playa',
                ),
              ],
            ),
          ),
        ]),
        bottomSheet: BuyInfoCartWidget(price: controller.getBuyPrice()),
      ),
    );
  }

  List<Widget> getProductsCartWidget(Map<Product, int> products) {
    List<Widget> result = [];
    products.forEach((product, amount) {
      result.add(ProductItemCart(product: product));
    });
    return result;
  }
}
// Container buyButton(double bottomHeight, BuildContext context) {
//   return Container(
//     height: bottomHeight,
//     width: context.width,
//     padding:
//         EdgeInsets.symmetric(horizontal: context.width * 0.1, vertical: 10),
//     decoration: const BoxDecoration(color: Colors.white),
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       SizedBox(
//         width: 200,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const ThinAppText(text: 'Total', size: 14),
//             RegularAppText(text: '${sumOfItems()} mm', size: 27),
//             const ThinAppText(
//                 text: 'No incluye el precio de la mensajería', size: 14)
//           ],
//         ),
//       ),
//       InkWell(
//         onTap: () {},
//         child: Container(
//             width: 200,
//             height: 60,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: bisneColorPrimary),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('COMPRAR',
//                     style: TextStyle(color: Colors.white, fontSize: 20)),
//                 Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(50)),
//                   child: const Icon(Icons.arrow_forward_ios_rounded),
//                 )
//               ],
//             )),
//       )
//     ]),
//   );
// }

// List<Widget> productsItems(BuildContext context, CartController _) {
//   return _.itemsToBuy.keys.map((product) {
//     return Column(
//       children: [
//         productItemCart(context, _, product),
//         Divider(
//           indent: context.width * 0.35,
//           endIndent: context.width * 0.3,
//         )
//       ],
//     );
//   }).toList();
// }

//   Widget requiredInfo(BuildContext context, double bottomHeight) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
//       child: Container(
//         margin: const EdgeInsets.only(top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Row(
//               children: [
//                 BoldAppText(text: 'Datos requeridos', size: 30),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               child: ListBody(
//                 children: [
//                   inputTextCartWidget(context, 'Teléfono', Icons.phone,
//                       controller: _textPhoneNumberController),
//                   inputTextCartWidget(context, 'Nombre', Icons.person,
//                       controller: _textUserNameController),
//                   inputTextCartWidget(context, 'Mensajería', CustomIcons.truck,
//                       controller: _textAddressController),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: bottomHeight + 25,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget productItemCart(
//     BuildContext context, CartController _, Product product) {
//   return Container(
//     width: 350,
//     margin: const EdgeInsets.only(bottom: 10),
//     child: Row(
//       children: [
//         CircularImage(
//             size: 50, child: Image(image: AssetImage(product.imagesUrl[0]))),
//         const SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             RegularAppText(text: product.name, size: 16),
//             ThinAppText(text: product.shopDump.name, size: 14),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: RegularAppText(
//                   text: '${product.price} mm',
//                   size: 16,
//                   color: bisneColorPrimary),
//             ),
//             countController(context, _, product),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget countController(
//     BuildContext context, CartController _, Product product) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       IconButton(
//           onPressed: () async {
//             if (_.itemsToBuy[product]! == 1.obs) {
//               bool result = await showAlertDialog(context);
//               if (result) {
//                 _.removeProduct(product);
//               }
//               return;
//             }
//             _.removeProduct(product);
//           },
//           icon: const Icon(Icons.remove_circle, size: 15)),
//       Obx(() => SizedBox(
//           width: 20,
//           child: Center(
//               child: BoldAppText(
//                   text: _.itemsToBuy[product].toString(), size: 15)))),
//       IconButton(
//           onPressed: () {
//             _.addProduct(product, 1);
//           },
//           icon: const Icon(Icons.add_circle, size: 15))
//     ],
//   );
// }

Future<dynamic> showAlertDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar producto'),
        content: const Text(
            '¿Estás seguro de que quieres eliminar este producto de tu lista de compras?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // Cierra el diálogo
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              Navigator.of(context).pop(true); // Cierra el diálogo
            },
          ),
        ],
      );
    },
  );
}
