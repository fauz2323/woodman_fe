import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/module/presentation/view/splash/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initial(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            home: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            login: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => _initial(context),
            orElse: () => _initial(context),
          );
        },
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          const Text(
            "WOODMAN.PROJECT",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          Image.asset(
            'asset/images/logo.png',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Make beauty from inside",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
