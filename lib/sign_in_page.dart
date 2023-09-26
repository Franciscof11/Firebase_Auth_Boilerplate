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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 80),
                //
                const Icon(
                  Icons.lock,
                  size: 180,
                ),
                //
                const SizedBox(height: 20),
                Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 26),
                const CustomTextField(label: 'Username'),
                const SizedBox(height: 16),
                const CustomTextField(label: 'Password', isSecret: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
