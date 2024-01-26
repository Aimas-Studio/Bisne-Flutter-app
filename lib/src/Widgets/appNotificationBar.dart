import 'package:flutter/material.dart';

import 'notification_button_widget.dart';
import 'return_button_widget.dart';

Widget appNotificationBar(context, bool returnButton, {IconData? iconData}) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    alignment: Alignment.bottomRight,
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      children: [
        returnButton ? returnButtonWidget() : Container(),
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            child:
                iconData == null ? Container() : NotificationButton(iconData),
          ),
        ),
      ],
    ),
  );
}
