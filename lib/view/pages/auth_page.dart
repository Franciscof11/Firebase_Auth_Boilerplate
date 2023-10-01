import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'sign_in_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Escuta se o user está logado ou não
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // usuário logado
        if (snapshot.hasData) {
          return const HomePage();
        }
        // usuário não está  logado
        else {
          return const SignInPage();
        }
      },
    );
  }
}
