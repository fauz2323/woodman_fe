import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/helper/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woodman Project',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routes: RouteHelper.routes,
      initialRoute: '/checkout_order',
    );
  }
}
