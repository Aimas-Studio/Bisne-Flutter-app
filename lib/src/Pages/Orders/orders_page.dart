import 'package:bisne/src/Pages/Orders/Providers/order_provider.dart';
import 'package:flutter/material.dart';

import '../../core/Utils/Entities/facture.dart';
import '../../core/Utils/interfaces.dart';
import '../../core/Utils/texts.dart';
import '../../core/widgets/secondary_app_bar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: secondaryAppBar(context, true),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldAppText("Pedidos Realizados", 27),
              FutureBuilder<List<Facture>>(
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
        height: 50,
        child: const Divider(),
      ))
      ..add(shopOrderWidget(context, element, isCheckBox: true));
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
