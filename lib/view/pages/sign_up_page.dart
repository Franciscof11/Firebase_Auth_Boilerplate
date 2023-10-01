import 'package:auth_boilerplate/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/create_user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  label: 'Email', controller: emailSignUpController),
              const SizedBox(height: 40),
              CustomTextField(
                  label: 'Password', controller: passwordSignUpController),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.validate();

                  createUser(
                    email: emailSignUpController.text,
                    password: passwordSignUpController.text,
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Create account',
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
