import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/module/presentation/view/empty_cart/cubit/empty_cart_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmptyCartCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EmptyCartCubit, EmptyCartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => _loaded(),
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

  Center _loaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/empty_cart.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 35),
          Text(
            'Your cart is empty',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFB200),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You dont have any items in your chart!',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFB200),
            ),
          ),
          // button
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MyButtonWidget(
              onTap: () {},
              text: 'Start Shopping',
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }
}
