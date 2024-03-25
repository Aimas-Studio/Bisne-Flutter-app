import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class ReturnButtonAppbar extends StatelessWidget {
  const ReturnButtonAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.only(left: 7)),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder(eccentricity: 0))),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: iconAppColor,
        ),
      ),
    );
  }
}
