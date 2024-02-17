import 'package:bisne/src/Pages/SuccessfulOrders/successful_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulOrders extends StatelessWidget {
  const SuccessfulOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SuccessfulController>(
      () => SuccessfulController(),
    );
    final controller = Get.find<SuccessfulController>();
    return Container();
  }
}
