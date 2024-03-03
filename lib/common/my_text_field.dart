import 'package:flutter/material.dart';
import 'package:my_terget_app/core/style/style_text.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLine,
      this.textInputType});

  final TextEditingController controller;
  final String hintText;
  final int? maxLine;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: b2Bold(),
      maxLines: maxLine ?? 1,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: b2Reguler(),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.2),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }
}
