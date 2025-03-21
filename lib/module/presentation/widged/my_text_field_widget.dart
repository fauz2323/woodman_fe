import 'package:flutter/material.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';

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
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsTheme.blackColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}
