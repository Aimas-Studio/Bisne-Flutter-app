import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar snackAppBar({
  Color color = fontAppColor,
  required String message,
  Duration duration = const Duration(seconds: 3),
}) {
  return GetSnackBar(
    backgroundColor: color,
    title: message,
    duration: duration,
  );
}
