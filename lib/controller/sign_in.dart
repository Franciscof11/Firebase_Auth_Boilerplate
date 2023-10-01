// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signIn({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    ),
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pop(context);
    //
  } on FirebaseAuthException catch (e) {
    print('------------------------------------------');
    print(e.code);
    Navigator.pop(context);
    if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
      print('###########################');
      print('Invalid Credentials!');

      showDialog(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 240),
          child: Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Invalid Credentials!',
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
  }
}
