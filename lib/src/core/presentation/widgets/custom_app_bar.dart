import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'buttons/return_button_widget.dart';

class CustomAppBar extends AppBar {
  final bool returnButton;
  final Widget? widget;

  CustomAppBar({super.key, this.returnButton = true, this.widget})
      : super(
          forceMaterialTransparency: true,
          backgroundColor: backgroundAppColor,
          toolbarHeight: 45,
          elevation: 0,
          leading: const ReturnButtonAppbar(),
        );
}

// class IconCartWidget extends StatelessWidget {
//   const IconCartWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final _ = Get.find<ShopPageController>();
//     return Badge(
//       offset: const Offset(-3, 0),
//       isLabelVisible: _.cart.isNotEmpty,
//       largeSize: 22,
//       alignment: Alignment.bottomLeft,
//       backgroundColor: bisneColorPrimary,
//       label: SizedBox(
//         width: 15,
//         child: Center(
//           child: Obx(() => Text(
//                 _.cart.length > 99
//                     ? '${_.cart.length}+'
//                     : _.cart.length.toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 15),
//               )),
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(50)),
//         child: IconButton(
//           icon: const Icon(
//             Icons.shopping_cart_outlined,
//             size: 40,
//           ),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => CartPage(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
