import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/registration/registration_provider.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => RegistrationProvider(),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: RegistrationForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

