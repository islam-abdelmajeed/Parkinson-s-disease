import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Color(0xff58B0CD),
          ),
        ),
      ),
    );
  }
}
