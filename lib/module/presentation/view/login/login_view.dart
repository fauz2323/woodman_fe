import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/core/helper/size_helper.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/presentation/view/login/cubit/login_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_circular_button_widget.dart';
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
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
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
            state.maybeWhen(
              orElse: () {},
              success: (token) async {
                await TokenHelper().setToken(token);
                print("success");
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: (activeObsecure) => _loaded(context, activeObsecure),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (token) => _loaded(context, true),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: ColorsTheme.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.1,
            ),
            const Text(
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
              child: const Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorsTheme.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: SizeHelper.getScreenHeight(context) * 0.02,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MyCircularButtonWidget(
                onTap: () async {
                  var message = await context.read<LoginCubit>().login(
                        emailController.text,
                        passwordController.text,
                      );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                icon: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
