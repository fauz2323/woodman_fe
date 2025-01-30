import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/main/view/pages/beranda/beranda_view.dart';
import 'package:woodman_project_fe/main/view/pages/cart/cart_view.dart';
import 'package:woodman_project_fe/main/view/pages/home/cubit/home_cubit.dart';
import 'package:woodman_project_fe/main/view/pages/product/product_view.dart';
import 'package:woodman_project_fe/main/view/pages/profile/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _fragment = <Widget>[
    BerandaView(),
    ProductView(),
    CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  // Build
  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Placeholder(),
              initial: (index) => _fragment.elementAt(index),
            );
          },
        ),
      ),
      // Botton Navbar
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Text('Some error'),
            initial: (index) => NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home',
                  selectedIcon: Icon(
                    Icons.home,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_rounded, color: Colors.white),
                  label: 'Products',
                  selectedIcon: Icon(
                    Icons.category_rounded,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
                  label: 'Cart',
                  selectedIcon: Icon(
                    Icons.shopping_cart_rounded,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  label: 'Profile',
                  selectedIcon: Icon(
                    Icons.account_circle,
                    color: Color(0xff754E1A),
                  ),
                ),
              ],
              selectedIndex: index,
              indicatorColor: Colors.transparent,
              backgroundColor: const Color(0xffFFB200),
              onDestinationSelected: (index) {
                context.read<HomeCubit>().setSelected(index);
              },
            ),
          );
        },
      ),
    );
  }
}
