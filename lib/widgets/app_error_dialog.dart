import 'package:flutter/material.dart';

import 'app_elevated_button.dart';

class AppErrorDialog extends StatelessWidget {
  final String title;
  final String message;

  const AppErrorDialog({
    super.key,
    required this.title,
    required this.message,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
  }) async =>
      await showDialog(
        context: context,
        useSafeArea: true,
        useRootNavigator: true,
        builder: (context) => AppErrorDialog(
          title: title,
          message: message,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            color: Colors.red.shade400,
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff596992),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                AppElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.red.shade400,
                  label: ('retry').toUpperCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   // padding: const EdgeInsets.all(20),
    //   // decoration: const BoxDecoration(
    //   //   color: Colors.white,
    //   //   borderRadius: BorderRadius.all(
    //   //     Radius.circular(20),
    //   //   ),
    //   // ),
    //   child: Column(
    //     // mainAxisSize: MainAxisSize.min,
    //     children: [
    //       // Container(
    //       //   color: Colors.red,
    //       //   child: const Center(
    //       //     child: Column(
    //       //       children: [
    //       //         Icon(Icons.error_outline, color: Colors.white,),
    //       //         SizedBox(height: 10),
    //       //         Text(
    //       //           'No Internet',
    //       //           style: TextStyle(
    //       //             color: Colors.white,
    //       //             fontSize: 16,
    //       //             fontWeight: FontWeight.w600,
    //       //           ),
    //       //         ),
    //       //       ],
    //       //     ),
    //       //   ),
    //       // ),
    //       // const SizedBox(height: 20),
    //       // Column(
    //       //   mainAxisSize: MainAxisSize.min,
    //       //   children: [
    //       //     const Text(
    //       //       'Something went wrong, please try again',
    //       //       style: TextStyle(
    //       //         color: Color(0xff596992),
    //       //         fontSize: 16,
    //       //         fontWeight: FontWeight.w500,
    //       //       ),
    //       //     ),
    //       //     const SizedBox(height: 20),
    //       //     AppElevatedButton(
    //       //       onPressed: () {
    //       //         Navigator.pop(context);
    //       //       },
    //       //       label: ('retry').toUpperCase(),
    //       //     ),
    //       //   ],
    //       // ),
    //     ],
    //   ),
    // );
    //
  }
}
