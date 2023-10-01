import 'package:auth_boilerplate/controller/sign_out.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User logged!'),
            const SizedBox(height: 50),
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
