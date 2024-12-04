import 'package:flutter/material.dart';

import '../main/view/pages/login/login_view.dart';
import '../main/view/pages/register/register_view.dart';
import '../main/view/pages/splash/splash_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/login': (context) => LoginView(),
    '/register': (context) => RegisterView(),
  };
}
