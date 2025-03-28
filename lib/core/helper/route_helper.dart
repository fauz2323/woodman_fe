import 'package:flutter/material.dart';
import 'package:woodman_project_fe/module/presentation/view/checkout_order/checkout_order_view.dart';
import 'package:woodman_project_fe/module/presentation/view/edit_profile/edit_profile_view.dart';
import 'package:woodman_project_fe/module/presentation/view/empty_cart/empty_cart_view.dart';
import 'package:woodman_project_fe/module/presentation/view/home/home_view.dart';
import 'package:woodman_project_fe/module/presentation/view/product_detail/product_detail_view.dart';
import 'package:woodman_project_fe/module/presentation/view/review_order/review_order_view.dart';

import '../../module/presentation/view/login/login_view.dart';
import '../../module/presentation/view/register/register_view.dart';
import '../../module/presentation/view/splash/splash_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/login': (context) => const LoginView(),
    '/register': (context) => const RegisterView(),
    '/home': (context) => const HomeView(),
    '/detail_product': (context) => const ProductDetailView(), // tempporary
    '/edit_profile': (context) => EditProfileView(),
    '/empty_cart': (context) => const EmptyCartView(), // temporary
    '/checkout_order': (context) => const CheckoutOrderView(), // temporary
    '/review_order': (context) => const ReviewOrderView(), // temporary
  };
}
