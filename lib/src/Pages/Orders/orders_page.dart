import 'package:flutter/material.dart';

import '../../Utils/interfaces.dart';
import '../../Widgets/appNotificationBar.dart';
import 'Providers/order_provider.dart';
import 'Widgets/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appNotificationBar(context, true,
                  iconData: Icons.notifications_none),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pedidos Realizados",
                      style: TextStyle(
                        color: fontAppColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    ...getAllOrders(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getAllOrders(context) {
  List<Widget> orders = [];
  getShopOrdersInfo().forEach((element) {
    orders
      ..add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 20,
        child: const Divider(),
      ))
      ..add(shopOrderWidget(
        NetworkImage(element.shop.imageUrl),
        element.shop.shopName,
        element.date.toString(),
        element.totalPrice,
      ));
  });
  return orders;
}
