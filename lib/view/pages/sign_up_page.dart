import 'package:auth_boilerplate/view/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/sign_up.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_in_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailSignUpController = TextEditingController();
    final passwordSignUpController = TextEditingController();
    final confirmPassword = TextEditingController();
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) => SingleChildScrollView(
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
                    "Let's create an account for you",
                    style: GoogleFonts.rubik(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 26),
                  CustomTextField(
                    label: 'Email',
                    controller: emailSignUpController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Password',
                    isSecret: true,
                    controller: passwordSignUpController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Confirm password',
                    isSecret: true,
                    controller: confirmPassword,
                  ),
                  const SizedBox(height: 45),
                  ElevatedButton(
                    onPressed: () async {
                      /*   formKey.currentState?.validate(); */
                      if (passwordSignUpController.text ==
                          confirmPassword.text) {
                        createUser(
                          email: emailSignUpController.text,
                          password: passwordSignUpController.text,
                          context: context,
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 240),
                            child: Card(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Passwords dont match!',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 80),
                      backgroundColor: Colors.black,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.rubik(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    ),
                    child: Text(
                      "Already have an account?",
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
      ),
    );
  }
}
