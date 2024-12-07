import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/helper/size_helper.dart';
import 'package:woodman_project_fe/main/view/pages/register/cubit/register_cubit.dart';
import 'package:woodman_project_fe/main/view/widged/my_circular_button_widget.dart';
import 'package:woodman_project_fe/main/view/widged/my_text_field_widget.dart';
import 'package:woodman_project_fe/theme/color_themes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: () async {
                Navigator.pushNamed(context, '/home');
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: (activeObsecure) => _loaded(
                context,
                activeObsecure,
              ),
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
      ),
    );
  }

  Widget _loaded(BuildContext context, bool activeObsecure) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: ColorThemes.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.1),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.14),
            // Email
            MyTextFieldWidget(
                controller: emailController,
                hintText: 'Email',
                isPassword: false),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.05),
            // Phone
            MyTextFieldWidget(
              controller: phoneController,
              hintText: 'Phone',
              isPassword: false,
            ),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.05),
            // First Name and Last Name
            Row(
              children: [
                Expanded(
                  child: MyTextFieldWidget(
                    controller: firstNameController,
                    hintText: 'First Name',
                    isPassword: false,
                  ),
                ),
                SizedBox(width: SizeHelper.getScreenWidth(context) * 0.03),
                Expanded(
                  child: MyTextFieldWidget(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    isPassword: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.05),
            // Password
            MyTextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              isPassword: activeObsecure,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<RegisterCubit>().setObsecure(activeObsecure);
                },
                icon: Icon(
                  activeObsecure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.05),
            // Confirm Password
            MyTextFieldWidget(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              isPassword: activeObsecure,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<RegisterCubit>().setObsecure(activeObsecure);
                },
                icon: Icon(
                  activeObsecure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),

            // Register Button
            SizedBox(height: SizeHelper.getScreenHeight(context) * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: MyCircularButtonWidget(
                onTap: () {},
                icon: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
