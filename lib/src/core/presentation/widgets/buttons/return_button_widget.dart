import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class ReturnButtonAppbar extends StatelessWidget {
  const ReturnButtonAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(EdgeInsets.only(left: 7))),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: iconAppColor,
      ),
    );
  }
}
