import 'package:flutter/material.dart';

import '../../../theme/color_themes.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorThemes.blackColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorThemes.primaryColor,
          ),
        ),
      ),
    );
  }
}
