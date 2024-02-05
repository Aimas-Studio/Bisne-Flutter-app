import 'package:bisne/src/Pages/Orders/Providers/order_provider.dart';
import 'package:bisne/src/Pages/Orders/Widgets/order_widget.dart';
import 'package:bisne/src/Utils/Entities/facture.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

import '../../Utils/texts.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: secondaryAppBar(context, true),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldAppText("Pedidos Realizados", 27),
              FutureBuilder(
                future: getShopOrdersInfo(),
                // initialData: loadingPageWidget(),
                builder: (
                  context,
                  AsyncSnapshot<List<Facture>> snapshot,
                ) {
                  return snapshot.hasData
                      ? getOrdersWidget(context, snapshot.data!)
                      : loadingPageWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getOrdersWidget(context, List<Facture> factures) {
  List<Widget> orders = [];
  for (var element in factures) {
    orders
      ..add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 20,
        child: const Divider(),
      ))
      ..add(shopOrderWidget(element));
  }
  return Column(
    children: orders,
  );
}

Widget loadingPageWidget() {
  return const Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/Images/placeholder.png"),
          ),
        ],
      ),
    ),
  );
}
