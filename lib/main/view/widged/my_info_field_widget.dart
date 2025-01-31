import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/helper/constants.dart';

class InformationFieldWidget extends StatelessWidget {
  final String value;

  const InformationFieldWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 0.5,
          color: AppColors.dividerColor,
          thickness: 1,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
