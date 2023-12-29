import 'package:bisnes/src/Utils/custom_icons.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Color.fromRGBO(245, 246, 248, 1),
          child: IconButton(
            color: const Color.fromRGBO(114, 124, 142, 1),
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
                color: const Color.fromRGBO(29, 176, 3, 1)),
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
