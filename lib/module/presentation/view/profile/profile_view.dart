import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/presentation/view/profile/cubit/profile_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

import '../../../../core/theme/text_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (conetxt, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const MyLoadingWidget(),
            loaded: (data) => _loaded(context),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _loaded(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        children: [
          Center(
            child: Text(
              "Profile",
              style: TextStyleThemes.tittleTextStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'asset/images/logo.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Username",
            style: TextStyleThemes.subtitleTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Email",
            style: TextStyleThemes.subtitleTextStyle,
          ),
          const SizedBox(
            height: 40,
          ),
          ItemListMenuWidget(
            onTap: () {
              Navigator.pushNamed(context, '/edit_password');
            },
            title: "Edit Password",
            icon: Icons.vpn_key,
          ),
          ItemListMenuWidget(
            onTap: () {
              Navigator.pushNamed(context, '/order_history');
            },
            title: "My Orders",
            icon: Icons.shopping_bag,
          ),
          ItemListMenuWidget(
            onTap: () {
              Navigator.pushNamed(context, '/edit_profile');
            },
            title: "My Address",
            icon: Icons.location_on,
          ),
          const Padding(padding: EdgeInsets.only(top: 35)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await context.read<ProfileCubit>().logout();
                if (!context.mounted) return;
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemListMenuWidget extends StatelessWidget {
  const ItemListMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorsTheme.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyleThemes.subtitleTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
