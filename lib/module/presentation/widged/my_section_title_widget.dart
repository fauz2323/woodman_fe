import 'package:flutter/material.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/core/theme/text_theme.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onEditPressed;

  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyleThemes.tittleTextStyle,
        ),
        IconButton(
          icon: const Icon(
            Icons.create,
            size: 28,
            color: ColorsTheme.primaryColor,
          ),
          onPressed: onEditPressed,
        ),
      ],
    );
  }
}
