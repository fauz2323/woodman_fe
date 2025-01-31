import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
      this.leftIcon,
      this.rightIcon,
      this.color = const Color(0xffFFB200),
      required this.radius});
  final Function() onTap;
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // left icon
              Icon(leftIcon, size: 28, color: Colors.white),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Icon(rightIcon, size: 24, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
