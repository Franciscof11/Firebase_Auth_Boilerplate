import 'package:auth_boilerplate/controller/google_sign_in.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatefulWidget {
  final String urlImage;

  const GoogleSignInButton({
    super.key,
    required this.urlImage,
  });

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signInWithGoogle();
        const CircularProgressIndicator();
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
            border: Border.all(
              color: Colors.white,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            widget.urlImage,
            height: 55,
          ),
        ),
      ),
    );
  }
}
