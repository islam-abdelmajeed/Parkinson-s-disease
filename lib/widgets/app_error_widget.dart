import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String msg;
  final VoidCallback? onRetry;

  const AppErrorWidget({
    super.key,
    required this.msg,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRetry,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_rounded,
              color: Color(0xff58B0CD),
              size: 50,
            ),
            const SizedBox(height: 10),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Icon(
              Icons.refresh_rounded,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
