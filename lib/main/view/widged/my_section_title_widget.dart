import 'package:flutter/material.dart';
import 'package:woodman_project_fe/helper/constants.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onEditPressed;

  const SectionTitleWidget({
    Key? key,
    required this.title,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.titleTextStyle(context),
        ),
        IconButton(
          icon: const Icon(
            Icons.create,
            size: 28,
            color: AppColors.primaryColor,
          ),
          onPressed: onEditPressed,
        ),
      ],
    );
  }
}