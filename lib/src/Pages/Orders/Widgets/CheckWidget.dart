import 'package:bisne/src/core/utils/interfaces.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatefulWidget {
  CheckWidget({super.key, this.notifyParent, this.isChecked = true});
  bool isChecked;
  VoidCallback? notifyParent;

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isChecked ? checkOnButton() : checkOffButton();
  }

  InkWell checkOffButton() {
    return InkWell(
      onTap: () {
        widget.isChecked = true;
        setState(() {});
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            color: iconAppColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Icon(
          Icons.horizontal_rule_sharp,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  InkWell checkOnButton() {
    return InkWell(
      onTap: () {
        widget.isChecked = false;
        setState(() {});
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            color: bisneColorPrimary,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
