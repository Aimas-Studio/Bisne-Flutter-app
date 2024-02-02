import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ContentPanel {
  IconData iconData;
  String title;
  Callback function;
  ContentPanel(this.iconData, this.title, this.function);
}
