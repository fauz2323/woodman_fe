import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/helper/constants.dart';
import 'package:woodman_project_fe/main/view/widged/my_info_field_widget.dart';
import 'package:woodman_project_fe/main/view/widged/my_profile_info_widget.dart';
import 'package:woodman_project_fe/main/view/widged/my_section_title_widget.dart';

import '../../widged/my_button_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _build(),
    );
  }

  Widget _build() {
    return Padding(
      padding: AppPadding.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info
          const ProfileInfoWidget(
            username: 'Username',
            email: 'example@gmail.com',
            avatarPath: 'asset/images/profile.jpg',
          ),
          const SizedBox(height: 30),

          // My Order History Button
          MyButtonWidget(
            onTap: () {},
            radius: 50,
            leftIcon: Icons.shopping_cart_checkout_rounded,
            text: 'My Order History',
            rightIcon: Icons.arrow_right_alt_rounded,
          ),
          const SizedBox(height: 50),

          // Information Section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitleWidget(
                    title: 'Information',
                    onEditPressed: () {
                      // Handle edit information
                    },
                  ),
                  const SizedBox(height: 20),

                  // Information Fields
                  const InformationFieldWidget(value: 'Name'),
                  const InformationFieldWidget(value: 'Handphone'),
                  const InformationFieldWidget(value: 'Address'),
                  const InformationFieldWidget(value: 'Pos'),

                  // Logout Button
                  const SizedBox(height: 20),
                  MyButtonWidget(
                    onTap: () {
                      // Handle logout
                    },
                    text: 'Logout',
                    radius: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
