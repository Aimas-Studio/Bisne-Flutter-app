import 'package:flutter/cupertino.dart';

class ContentPanel {
  IconData iconData;
  String title;
  Function(dynamic context) function;
  ContentPanel(this.iconData, this.title, this.function);
}
