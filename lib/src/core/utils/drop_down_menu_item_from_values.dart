import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem> getItems(List<String> items) {
  final List<DropdownMenuItem> list = [];
  for (var item in items) {
    list.add(DropdownMenuItem(value: item, child: InputLightText(text: item)));
  }
  return list;
}
