import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlineTextField extends StatelessWidget {
  final String? labelText;
  final IconData? icons;
  final String? Function(String? data)? onValidator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool? validate;
  const OutlineTextField(
      {super.key,
      this.labelText,
      this.icons,
      this.onValidator,
      this.controller,
      this.inputFormatters,
      this.validate,
      this.initialValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: this.controller,
        validator: this.onValidator,
        initialValue: this.initialValue,
        inputFormatters: inputFormatters,
        // autovalidate: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: this.labelText,
          icon: Icon(this.icons),
        ));
  }
}
