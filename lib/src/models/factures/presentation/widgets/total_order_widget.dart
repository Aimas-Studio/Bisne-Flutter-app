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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LightAppText(text: 'Total'),
                BoldAppText(text: '$totalPrice mn', size: 28),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularAppText(text: namePurchase, size: 18),
                RegularAppText(text: date, size: 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
