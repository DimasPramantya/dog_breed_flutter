import '../utils/colors.dart';
import 'package:flutter/material.dart';

TextFormField customTextFormField({
  required TextEditingController controller,
  required String placeholder,
  bool? isObscure,
  Widget? suffixIcon,
}) {
  return TextFormField(
    obscureText: isObscure ?? false,
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      hintText: placeholder,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      fillColor: textBoxColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),
  );
}