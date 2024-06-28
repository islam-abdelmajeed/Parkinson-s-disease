import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/login/login_provider.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
