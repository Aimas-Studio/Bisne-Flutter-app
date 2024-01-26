import 'package:flutter/material.dart';

import 'package:bisne/src/Utils/interfaces.dart';

class NotificationButton extends StatelessWidget {
  final int value;
  final Icon icon;
  const NotificationButton(
      {super.key, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: backgroundAppColor,
          child: IconButton(
            color: iconAppColor,
            onPressed: () {},
            icon: icon,
            iconSize: 32,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bisneColorPrimary),
            child: Center(
                child: Text(
              value.toString(),
              style: const TextStyle(color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}
