import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/texts/texts_widgets.dart';

class TotalOrderWidget extends StatelessWidget {
  final String totalPrice;
  final String date;
  final String namePurchase;

  const TotalOrderWidget({
    super.key,
    required this.totalPrice,
    required this.date,
    required this.namePurchase,
  });

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LightAppText(text: 'Total'),
                  BoldAppText(text: totalPrice, size: 28),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularAppText(text: namePurchase, size: 13),
                  RegularAppText(text: date, size: 12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
