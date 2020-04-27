import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool password;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final String label;
  final String hint;

  InputFormField({
    this.validator,
    this.controller,
    this.password = false,
    this.keyboardType,
    this.focusNode,
    this.nextFocus,
    @required this.label,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(color: Colors.blue, fontSize: 25),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: label,
          labelStyle: TextStyle(fontSize: 25, color: Colors.grey),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16)),
    );
  }
}
