import 'package:flutter/cupertino.dart';

class ContentPanel {
  IconData iconData;
  String title;
  VoidCallback function;

  ContentPanel(this.iconData, this.title, this.function);
}
