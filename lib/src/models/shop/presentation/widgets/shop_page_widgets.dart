import 'package:bisne/src/models/shop/export.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../screens/shop_more_info_page.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.rate,
    required this.description,
  });

  final String title;
  final Widget subtitle;
  final Widget trailing;
  final String rate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Expanded(
              flex: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldAppText(
                    text: title,
                    size: 30,
                    color: Colors.black,
                  ),
                  subtitle,
                ],
              )),
          Expanded(
              flex: 20,
              child: Row(
                children: [trailing],
              ))
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          StarsWidget(rate: rate),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      RegularAppText(
        text: description,
        size: 20,
        maxLines: 4,
        color: Colors.black,
      ),
    ]);
  }
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    super.key,
    required this.rate,
  });

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          return index + 1 < double.parse(rate)
              ? const Icon(
                  Icons.star_rounded,
                  size: 30,
                  color: Color.fromRGBO(253, 217, 75, 1),
                )
              : const Icon(Icons.star_rounded,
                  size: 30, color: Color.fromRGBO(246, 237, 199, 1));
        },
      )..add(
          RegularAppText(
            text: '($rate)',
            size: 20,
          ),
        ),
    );
  }
}

class FavoriteLargeButton extends StatefulWidget {
  const FavoriteLargeButton({
    super.key,
  });

  @override
  State<FavoriteLargeButton> createState() => _FavoriteLargeButtonState();
}

class _FavoriteLargeButtonState extends State<FavoriteLargeButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: ButtonStyle(
            side: const MaterialStatePropertyAll(
                BorderSide(color: Colors.black26, width: 1)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(10))),
        child: Row(children: [
          Icon(_isPressed ? Icons.favorite_sharp : Icons.favorite_border,
              color: _isPressed ? Colors.red : iconAppColor),
          const SizedBox(
            width: 5,
          ),
          const RegularAppText(text: 'Guardar favorito', size: 18),
          const SizedBox(
            width: 10,
          )
        ]));
  }
}

class TextButtonShowMoreInfo extends StatelessWidget {
  final Shop shop;
  const TextButtonShowMoreInfo({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    ShopMoreInfoPage(
                  shop: shop,
                ),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
          child: const BoldAppText(
              text: 'Ver más información...', size: 18, color: Colors.black),
        ),
      ],
    );
  }
}
