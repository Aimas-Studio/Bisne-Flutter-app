import 'package:bisne/src/Pages/Cart/cart_page.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'return_button_widget.dart';

AppBar secondaryAppBar(context, bool returnButton,
    {IconData? iconData, ShopPageController? shopPageController}) {
  return AppBar(
    forceMaterialTransparency: true,
    backgroundColor: backgroundAppColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.15,
    elevation: 0,
    actions: [
      returnButton ? returnButtonWidget(context) : Container(),
      Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          child: iconData == null
              ? Container()
              : badge(context, iconData, shopPageController),
        ),
      ),
      const SizedBox(width: 10)
    ],
  );
}

Widget badge(BuildContext context, IconData iconData, ShopPageController? _) {
  return Badge(
    offset: const Offset(-3, 0),
    isLabelVisible: _!.cart.value.isNotEmpty,
    largeSize: 22,
    alignment: Alignment.bottomLeft,
    backgroundColor: bisneColorPrimary,
    label: SizedBox(
      width: 15,
      child: Center(
        child: Obx(() => Text(
              _.cart.value.length > 99
                  ? '${_.cart.value.length}+'
                  : _.cart.value.length.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )),
      ),
    ),
    child: IconButton(
      icon: Icon(
        iconData,
        size: 40,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CartPage(),
          ),
        );
      },
    ),
  );
}
