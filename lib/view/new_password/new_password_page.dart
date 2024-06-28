import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/new_password/new_password_provider.dart';

import 'widgets/new_password_form.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;

  const NewPasswordPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => NewPasswordProvider(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: NewPasswordForm(email: email),
          ),
        ),
      ),
    );
  }
}


