import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/padding_theme.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_text_field_widget.dart';

class EditAddressView extends StatelessWidget {
  EditAddressView({super.key});
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Address'),
      ),
      body: Padding(
        padding: PaddingTheme.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Address:',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Lorem Ipsum Dolor Sit Amet...',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyTextFieldWidget(
              controller: addressController,
              hintText: 'Edit Address',
              isPassword: false,
            ),
            const Spacer(),
            MyButtonWidget(onTap: () {}, text: 'Update', radius: 8),
          ],
        ),
      ),
    );
  }
}
