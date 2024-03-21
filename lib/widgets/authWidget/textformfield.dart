import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String text;
  final IconData suffixicon;
  final TextEditingController? controller;
  final String? Function(String?)? validinput;
  final TextInputType keyboardType;
  final bool? obscuretext;
  final void Function()? ontap;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.text,
    required this.suffixicon,
    required this.controller,
      this.validinput,
    required this.keyboardType,
    this.obscuretext,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext == null || obscuretext == false ? false : true,
      keyboardType: keyboardType,
      validator: validinput,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: ontap,
          child: Icon(suffixicon),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        hintText: text,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(label),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
