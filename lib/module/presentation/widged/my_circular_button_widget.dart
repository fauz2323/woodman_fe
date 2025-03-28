import 'package:flutter/material.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';

class MyCircularButtonWidget extends StatelessWidget {
  final Function() onTap;
  final IconData icon;

  const MyCircularButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsTheme.primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: ColorsTheme.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
