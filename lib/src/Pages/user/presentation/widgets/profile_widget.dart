import 'package:bisne/src/Pages/shop/infrastructure/services/get_shop_info.dart';
import 'package:bisne/src/core/presentation/widgets/images/circular_image.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_fade_in_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/buttons/custom_outline_button.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';

class ProfileWidget extends StatelessWidget {
  final String mainInfo;
  final String secondaryInfo;
  final String buttonLabel;
  final VoidCallback? buttonAction;
  final ImageProvider? image;

  const ProfileWidget({
    this.mainInfo = '',
    this.secondaryInfo = '',
    this.buttonLabel = '',
    this.buttonAction,
    this.image,
    super.key,
  });

  @override
  Widget build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: 10,
              top: 10),
          child: CircularImage(
            size: 55,
            child: CustomFadeInImage(image: getShopImage()),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: BoldAppText(text: mainInfo, size: 30),
            ),
            RegularAppText(text: secondaryInfo, size: 16),
            const SizedBox(
              height: 11,
            ),
            OutlineAppButton(
              onPressed: buttonAction,
              child: LightAppText(text: buttonLabel),
            ),
          ],
        )
      ],
    );
  }
}
