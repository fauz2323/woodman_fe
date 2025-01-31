import 'package:flutter/material.dart';
import 'package:woodman_project_fe/helper/constants.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String username;
  final String email;
  final String avatarPath;

  const ProfileInfoWidget({
    super.key,
    required this.username,
    required this.email,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            avatarPath,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        // Username & Email
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: AppTextStyles.titleTextStyle(context),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: AppTextStyles.subtitleTextStyle(context),
            ),
          ],
        ),
      ],
    );
  }
}
