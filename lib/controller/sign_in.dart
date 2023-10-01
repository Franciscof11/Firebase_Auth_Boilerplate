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
      child: CircularProgressIndicator(),
    ),
  );
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //
  } on FirebaseAuthException catch (e) {
    print('------------------------------------------');
    print(e.code);
    switch (e.code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        print('###########################');
        print('Invalid Credentials!');

      case 'a':
        print('###########################');
        print('');
    }
  }
  Navigator.pop(context);
}
