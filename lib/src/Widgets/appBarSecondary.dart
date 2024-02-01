import 'package:flutter/material.dart';
import 'package:widget_factory/Utils/interfaces.dart';

import 'notification_button.dart';
import 'return_button_widget.dart';

AppBar appBarSecondary(context, bool returnButton, {IconData? iconData}) {
  return AppBar(
    backgroundColor: backgroundAppColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.08,
    elevation: 0,
    actions: [
      returnButton ? returnButtonWidget() : Container(),
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: iconData == null ? Container() : NotificationButton(iconData),
        ),
      )
    ],
  );
}
