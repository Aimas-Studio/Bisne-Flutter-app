import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';

import 'return_button_widget.dart';

AppBar appBarSecondary(context, bool returnButton, {IconData? iconData}) {
  return AppBar(
    backgroundColor: backgroundAppColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.08,
    elevation: 0,
    actions: [
      returnButton ? returnButtonWidget(context) : Container(),
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: iconData == null ? Container() : Container(),
        ),
      )
    ],
  );
}
