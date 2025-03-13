import 'package:flutter/material.dart';

class MyDividerWidget extends StatelessWidget {
  const MyDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 32,
      thickness: 1,
      color: Colors.black,
    );
  }
}
