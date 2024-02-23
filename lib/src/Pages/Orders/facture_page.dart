import 'package:bisne/src/Pages/Orders/Providers/facture_provider.dart';
import 'package:bisne/src/Pages/Orders/Widgets/facture_widget.dart';
import 'package:bisne/src/Pages/Orders/Widgets/total_order_widget.dart';
import 'package:flutter/material.dart';

import '../../core/Utils/Entities/facture.dart';
import '../../core/Utils/Entities/product.dart';
import '../../core/Utils/interfaces.dart';
import '../../core/Utils/texts.dart';
import '../../core/widgets/secondary_app_bar.dart';

class FacturesPage extends StatelessWidget {
  final Facture facture;

  const FacturesPage(this.facture, {super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: secondaryAppBar(context, true),
        bottomNavigationBar: totalOrderWidget(
            context, facture.date.toString(), facture.totalPrice.toString()),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              boldAppText("Pedidos Realizados", 27),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: getPurchases(facture),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? getFacturesWidget(context, snapshot.data)
                        : Container();
                    //TODO change the container and put a placeholder
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getFacturesWidget(context, Map<ProductDump, int> purchases) {
  List<Widget> factures = [];
  purchases.forEach((product, amount) {
    factures
      ..add(factureWidget(product, amount))
      ..add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 20,
        child: const Divider(),
      ));
  });
  return SingleChildScrollView(
    child: Column(
      children: factures,
    ),
  );
}
