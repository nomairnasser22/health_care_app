import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  TextLink({super.key, required this.text, required this.ontab});

  final String text;
  Function ontab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontab(),
        child: const Text(
          "Forget Password ?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ));
  }
}
