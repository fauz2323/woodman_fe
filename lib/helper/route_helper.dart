import 'package:flutter/material.dart';
import 'package:woodman_project_fe/main/view/pages/edit_profile/edit_profile_view.dart';
import 'package:woodman_project_fe/main/view/pages/empty_cart/empty_cart_view.dart';
import 'package:woodman_project_fe/main/view/pages/home/home_view.dart';
import 'package:woodman_project_fe/main/view/pages/product_detail/product_detail_view.dart';

import '../main/view/pages/login/login_view.dart';
import '../main/view/pages/register/register_view.dart';
import '../main/view/pages/splash/splash_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/login': (context) => const LoginView(),
    '/register': (context) => const RegisterView(),
    '/home': (context) => const HomeView(),
    '/detail_product': (context) => const ProductDetailView(), // tempporary
    '/edit_profile': (context) => EditProfileView(),
    '/empty_cart': (context) => const EmptyCartView(), // temporary
  };
}
