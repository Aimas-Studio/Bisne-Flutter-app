import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Pages/Cart/cart_page.dart';
import '../../../Pages/shop/presentation/controllers/shop_page_controller.dart';
import '../themes/colors.dart';
import 'return_button_widget.dart';

AppBar secondaryAppBar(context, bool returnButton, {IconData? iconData}) {
  return AppBar(
    forceMaterialTransparency: true,
    backgroundColor: backgroundAppColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.09,
    elevation: 0,
    actions: [
      returnButton ? const ReturnButtonAppbar() : const SizedBox(),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: iconData == null ? const SizedBox() : const IconCartWidget(),
        ),
      ),
      const SizedBox(width: 10)
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  final bool returnButton;
  final IconData? iconData;

  const CustomAppBar({
    this.returnButton = true,
    this.iconData,
    super.key,
  });

  @override
  Widget build(context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: backgroundAppColor,
      toolbarHeight: MediaQuery.of(context).size.height * 0.09,
      elevation: 0,
      actions: [
        returnButton ? const ReturnButtonAppbar() : const SizedBox(),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: iconData == null ? const SizedBox() : const IconCartWidget(),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}

class IconCartWidget extends StatelessWidget {
  const IconCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<ShopPageController>();
    return Badge(
      offset: const Offset(-3, 0),
      isLabelVisible: _.cart.isNotEmpty,
      largeSize: 22,
      alignment: Alignment.bottomLeft,
      backgroundColor: bisneColorPrimary,
      label: SizedBox(
        width: 15,
        child: Center(
          child: Obx(() => Text(
                _.cart.length > 99
                    ? '${_.cart.length}+'
                    : _.cart.length.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
