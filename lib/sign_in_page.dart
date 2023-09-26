import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset('assets/login_img.png'),
              const SizedBox(height: 20),
              const Text("Welcome back you've been missed!"),
              const SizedBox(height: 10),
              const CustomTextField(label: 'Username'),
            ],
          ),
        ),
      ),
    );
  }
}
