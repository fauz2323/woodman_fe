import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/helper/size_helper.dart';
import 'package:woodman_project_fe/main/view/pages/login/cubit/login_cubit.dart';
import 'package:woodman_project_fe/theme/color_themes.dart';

import '../../widged/my_text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            state.maybeWhen(
              orElse: () {},
              success: () async {
                Navigator.pushNamed(context, '/home');
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: (activeObsecure) => _loaded(context, activeObsecure),
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: ColorThemes.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.1,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.14,
            ),
            MyTextFieldWidget(
              controller: emailController,
              hintText: 'Email',
              isPassword: false,
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.05,
            ),
            MyTextFieldWidget(
              controller: passwordController,
              hintText: "Password",
              isPassword: activeObsecure,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<LoginCubit>().setObsecure(activeObsecure);
                },
                icon: Icon(
                    activeObsecure ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.02,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorThemes.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.02,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorThemes.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: ColorThemes.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
