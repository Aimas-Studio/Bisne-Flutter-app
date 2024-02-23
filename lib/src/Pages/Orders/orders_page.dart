import 'package:bisne/src/Pages/Orders/Providers/order_provider.dart';
import 'package:bisne/src/Pages/Orders/Widgets/order_widget.dart';
import 'package:bisne/src/core/utils/colors.dart';
import 'package:bisne/src/core/widgets/secondary_app_bar.dart';
import 'package:bisne/src/core/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/entities/facture.dart';

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
              const BoldAppText(text: "Pedidos Realizados", size: 27),
              FutureBuilder(
                future: getShopOrdersInfo(),
                // initialData: loadingPageWidget(),
                builder: (context, AsyncSnapshot<List<Facture>> snapshot) {
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
      ..add(ShopOrderWidget(element, isCheckBox: true));
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
