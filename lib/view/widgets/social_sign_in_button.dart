import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  final String urlImage;
  const SocialSignInButton({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            urlImage,
            height: 55,
          ),
        ),
      ),
    );
  }
}
