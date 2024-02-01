import 'package:flutter/material.dart';

import '../Pages/User/Providers/user_providers.dart';

class NotificationButton extends StatelessWidget {
  final IconData iconData;

  const NotificationButton(this.iconData, {super.key});

  @override
  Widget build(context) {
    return Badge(
      backgroundColor: const Color.fromRGBO(29, 176, 3, 1),
      alignment: AlignmentDirectional.bottomStart,
      isLabelVisible: getNotificationCount() != 0,
      label: Text(
        getNotificationCount().toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(iconData),
        iconSize: 25,
      ),
    );
  }
}
