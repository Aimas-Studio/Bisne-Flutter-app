import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDropDownField extends StatelessWidget {
  final bool enabled;
  final Function(FormControl controller)? onChange;
  final List<DropdownMenuItem> items;
  final String formName;
  final String? hintText;
  final String? labelText;

  const CustomReactiveDropDownField({
    super.key,
    required this.items,
    this.enabled = true,
    required this.formName,
    this.hintText,
    this.labelText,
    this.onChange,
  });

  @override
  Widget build(context) {
    return ReactiveDropdownField(
      hint: InputLightText(text: hintText ?? ''),
      items: enabled ? items : [],
      decoration: InputDecoration(
        label: InputLightText(text: labelText ?? ''),
        enabled: enabled,
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
      formControlName: formName,
      onChanged: onChange,
    );
  }
}
