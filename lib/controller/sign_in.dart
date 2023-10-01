// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

void signIn({required String email, required String password}) async {
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
}
