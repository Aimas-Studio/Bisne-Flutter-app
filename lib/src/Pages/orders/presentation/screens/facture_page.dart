import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/secondary_app_bar.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../base/presentation/controllers/base_page_controller.dart';
import '../../../products/export.dart';
import '../../domain/facture_entity.dart';
import '../../infrastructure/services/orders_services.dart';
import '../widgets/facture_widget.dart';
import '../widgets/total_order_widget.dart';

class FacturesPage extends StatelessWidget {
  final Facture facture;

  const FacturesPage(this.facture, {super.key});

  @override
  Widget build(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BasePageController>().showBottomNavBar.value = false;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: secondaryAppBar(context, true),
        bottomNavigationBar: totalOrderWidget(
            context, facture.date.toString(), facture.totalPrice.toString()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const BoldAppText(text: "Pedidos Realizados", size: 27),
              const SizedBox(
                height: 20,
              ),
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
      ),
    );
  }
}

Widget getFacturesWidget(context, Map<Product, int> purchases) {
  List<Widget> factures = [];
  purchases.forEach((product, amount) {
    factures
      ..add(FactureWidget(product: product, amount: amount))
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
