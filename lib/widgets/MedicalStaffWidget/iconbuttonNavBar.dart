import 'package:flutter/material.dart';
import 'package:newest/controllers/MedicalStaffController/medicalStaffController.dart';
import 'package:newest/data/static/color.dart';

class IconBottomNavBar extends StatelessWidget {
  const IconBottomNavBar({
    super.key,
    this.ontab,
    required this.iconData,
    required this.selected,
  });

  final void Function()? ontab;
  final IconData iconData;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ontab,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: selected ? ColorApp.background : Colors.black,
          ),
        ));
  }
}
