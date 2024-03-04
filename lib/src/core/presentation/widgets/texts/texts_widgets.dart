import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class BoldAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final int? maxLines;

  const BoldAppText(
      {super.key,
      required this.text,
      this.size = 20,
      this.color = fontAppColor,
      this.maxLines});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RegularAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final int? maxLines;

  const RegularAppText(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = fontAppColor,
      this.maxLines});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? fontAppColor,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ThinAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final int? maxLines;

  const ThinAppText(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = fontAppColor,
      this.maxLines});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w200,
      ),
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class LightAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final int? maxLines;
  final TextAlign? align;

  const LightAppText(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = fontAppColor,
      this.maxLines,
      this.align});

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w300,
      ),
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class InputLightText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const InputLightText(
      {super.key,
      required this.text,
      this.color = fontAppColor,
      this.size = 11});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: 'Neusa',
        fontSize: size,
        color: color,
      ),
    );
  }
}
