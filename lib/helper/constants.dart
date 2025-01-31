import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primaryColor = Color(0xffFFB200);
  static const textColor = Color(0xff414040);
  static const dividerColor = Color(0xff414040);
}

class AppPadding {
  static const defaultPadding = EdgeInsets.all(16.0);
  static const smallPadding = EdgeInsets.symmetric(vertical: 8.0);
}

class AppTextStyles {
  static TextStyle titleTextStyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle subtitleTextStyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.textColor,
    );
  }
}
