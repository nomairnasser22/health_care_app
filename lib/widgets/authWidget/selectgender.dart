import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AuthController/SignupController.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingUpControllerImp>(
      builder: (controller) => Row(
        children: [
          Row(
            children: [
              Text("Male"),
              Radio(
                value: "Male",
                activeColor: Colors.blue,
                groupValue: controller.gender,
                onChanged: (value) => controller.genderValue(value),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Row(
            children: [
              Text("Female"),
              Radio(
                value: "Female",
                activeColor: Colors.blue,
                groupValue: controller.gender,
                onChanged: (value) => controller.genderValue(value),
              ),
            ],
          )
        ],
      ),
    );
  }
}
