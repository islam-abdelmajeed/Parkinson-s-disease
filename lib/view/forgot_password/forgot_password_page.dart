import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/forgot_password/forgot_password_provider.dart';
import 'widgets/forgot_password_form.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ForgotPasswordProvider(),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ForgotPasswordForm(),
          ),
        ),
      ),
    );
  }
}


