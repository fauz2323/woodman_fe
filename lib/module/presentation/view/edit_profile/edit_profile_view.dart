import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/padding_theme.dart';
import 'package:woodman_project_fe/module/presentation/view/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_circular_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_profile_info_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_text_field_widget.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController posController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => _loaded(context),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context) {
    return Padding(
      padding: PaddingTheme.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // profile info
          const ProfileInfoWidget(
            username: 'admin',
            email: 'admin@email.com',
            avatarPath: 'asset/images/profile.jpg',
          ),
          const SizedBox(height: 40),
          Text(
            'Edit Profile Information',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          // form
          // name
          MyTextFieldWidget(
            controller: nameController,
            hintText: 'Name',
            isPassword: false,
          ),
          const SizedBox(height: 24),
          // number
          MyTextFieldWidget(
            controller: numberController,
            hintText: 'Handphone',
            isPassword: false,
          ),
          const SizedBox(height: 24),
          // number
          MyTextFieldWidget(
            controller: addressController,
            hintText: 'Address',
            isPassword: false,
          ),
          const SizedBox(height: 24),
          // number
          MyTextFieldWidget(
            controller: posController,
            hintText: 'Pos',
            isPassword: false,
          ),
          const SizedBox(height: 24),
          // button
          Align(
            alignment: Alignment.centerRight,
            child: MyCircularButtonWidget(
              onTap: () {},
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
