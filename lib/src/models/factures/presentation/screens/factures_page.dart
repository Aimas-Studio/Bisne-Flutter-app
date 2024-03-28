import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/custom_app_bar.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../domain/facture_entity.dart';
import '../../infrastructure/services/orders_services.dart';
import '../widgets/facture_widget.dart';

class FacturesPage extends StatelessWidget {
  final bool shop;
  const FacturesPage({super.key, this.shop = false});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
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
                      ? getOrdersWidget(context, snapshot.data!, shop)
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

Widget getOrdersWidget(context, List<Facture> factures, bool shop) {
  List<Widget> orders = [];
  for (var element in factures) {
    orders
      ..add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50,
        child: const Divider(),
      ))
      ..add(FactureWidget(facture: element, shop: shop));
  }
  return Column(
    children: orders,
  );
}

Widget loadingPageWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/Images/placeholder.png"),
        ),
      ],
    ),
  );
}
