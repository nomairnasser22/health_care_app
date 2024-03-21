import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? ontap;
  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.text1,
      required this.text2,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: ontap,
          child: Text(
            text2,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
