import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

class ProductCartCounter extends StatefulWidget {
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;
  final int initialAmount;

  const ProductCartCounter({
    super.key,
    required this.onPlusPressed,
    required this.onMinusPressed,
    required this.initialAmount,
  });

  @override
  State<ProductCartCounter> createState() => _ProductCartCounterState();
}

class _ProductCartCounterState extends State<ProductCartCounter> {
  late int amount;

  @override
  initState() {
    amount = widget.initialAmount;
    super.initState();
  }

  @override
  Widget build(context) {
    return Row(children: [
      IconButton(
        onPressed: () {
          widget.onMinusPressed();
          setState(() {
            amount--;
          });
        },
        icon: const Icon(Icons.remove_circle, color: fontAppColor),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BoldAppText(text: amount.toString(), size: 15),
      ),
      IconButton(
          onPressed: () {
            widget.onPlusPressed();
            setState(() {
              amount++;
            });
          },
          icon: const Icon(Icons.add_circle, color: fontAppColor)),
    ]);
  }
}
