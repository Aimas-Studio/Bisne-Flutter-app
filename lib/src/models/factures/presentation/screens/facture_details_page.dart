import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../products/export.dart';
import '../../domain/facture_entity.dart';
import '../../infrastructure/services/orders_services.dart';
import '../widgets/product_facture_details_widget.dart';
import '../widgets/total_order_widget.dart';

class FactureDetailPage extends StatelessWidget {
  final Facture facture;
  final bool shop;

  const FactureDetailPage(this.facture, {super.key, this.shop = false});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const BoldAppText(text: "Pedidos Realizados", size: 27),
              const SizedBox(height: 20),
              FutureBuilder(
                  future: getPurchases(facture),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? getFacturesWidget(context, snapshot.data)
                        : const SizedBox();
                    //TODO change the container and put a placeholder
                  }),
            ],
          ),
        ),
        bottomSheet: TotalOrderWidget(
          totalPrice: facture.totalPrice.toString(),
          date: facture.date,
          namePurchase: shop ? facture.user.username : facture.shop.name,
        ),
      ),
    );
  }
}

Widget getFacturesWidget(context, Map<Product, int> purchases) {
  List<Widget> factures = [];
  purchases.forEach((product, amount) {
    factures
      ..add(ProductFactureDetailsWidget(product: product, amount: amount))
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
