import 'package:auth_boilerplate/controller/sign_out.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      username = FirebaseAuth.instance.currentUser?.email;
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User logged!'),
            const SizedBox(height: 25),
            Text(username!),
            ElevatedButton(
              onPressed: () => signOut(),
              child: const Text('SIGN OUT'),
            )
          ],
        ),
      ),
    );
  }
}
