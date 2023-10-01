import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/sign_in.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 60),
                //
                const Icon(
                  Icons.lock,
                  size: 140,
                ),
                //
                const SizedBox(height: 20),
                Text(
                  "Welcome back you've been missed!",
                  style: GoogleFonts.rubik(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 26),
                CustomTextField(label: 'Email', controller: emailController),
                const SizedBox(height: 16),
                CustomTextField(
                    label: 'Password',
                    isSecret: true,
                    controller: passwordController),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.rubik(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                    signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 80),
                    backgroundColor: Colors.black,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.rubik(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.rubik(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widthDevice <= 380 ? 80 : 100,
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 0.5,
                      ),
                    ),
                    Text(
                      "Or continue with",
                      style: GoogleFonts.rubik(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: widthDevice <= 380 ? 80 : 100,
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialSignInButton(urlImage: 'assets/google.png'),
                    SizedBox(width: 24),
                    SocialSignInButton(urlImage: 'assets/apple.png'),
                  ],
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
