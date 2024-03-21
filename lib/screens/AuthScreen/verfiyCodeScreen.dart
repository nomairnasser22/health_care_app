import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/AuthController/verfiyCodeController.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/authWidget/customTextbody.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/customtexttitle.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerfiyCodepasswordScreen extends StatelessWidget {
  const VerfiyCodepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodePasswordControllerImp controller =
        Get.put(VerfiyCodePasswordControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.background,
          elevation: 0.0,
          title: Text(
            "verificatoin Code",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: ListView(
            children: [
              const CustomTextTitleAuth(text: "Check Code "),

              const SizedBox(
                height: 20,
              ),

              const CustomTextBodyAuth(
                  text:
                      "Please Enter The Digit Code Sent To nomairnasser@gmail.com "),

              const SizedBox(
                height: 30,
              ),
              // add package flutter_otp_text_field

              OTPTextField(
                length: 4,
                fieldWidth: 50.0,
                fieldStyle: FieldStyle.box,
                onCompleted: (value) {
                  controller.goToResetPassword();
                },
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButtonAuth(
                text: " Check ",
                onPressed: () {
                  controller.goToResetPassword();
                },
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
