import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 80,
        height: 80,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: [
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.green,
          ],
        ),
      ),
    );
  }
}
