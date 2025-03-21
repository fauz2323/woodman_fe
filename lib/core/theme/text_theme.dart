import 'package:flutter/material.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';

class TextStyleThemes {
  static TextStyle? tittleTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.textColor,
  );

  static TextStyle subtitleTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: ColorsTheme.textColor,
  );
}
