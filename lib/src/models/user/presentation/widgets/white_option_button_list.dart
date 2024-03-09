//Flutter Imports
import 'package:flutter/material.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/decorations.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';

class WhiteOptionButtonList extends StatelessWidget {
  final List<ContentPanel> content;

  const WhiteOptionButtonList({super.key, required this.content});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.zero,
      decoration: whiteBoxDecoration,
      child: SizedBox(
        child: Column(
          children: getServices(content, context),
        ),
      ),
    );
  }
}

List<Widget> getServices(List<ContentPanel> content, context) {
  List<Widget> serviceList = [];
  for (var element in content) {
    serviceList
      ..add(
        TextButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: element.function,
          child: Row(
            children: [
              Icon(element.iconData, color: iconAppColor, size: 25),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: RegularAppText(text: element.title, size: 13),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconAppColor.withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 12,
                  color: iconAppColor,
                ),
              ),
            ],
          ),
        ),
      )
      ..add(const Divider(
        height: 5,
        endIndent: 15,
        indent: 38,
      ));
  }
  serviceList.removeLast();
  return serviceList;
}
