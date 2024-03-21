import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/AuthController/resetPasswordController.dart';
import 'package:newest/core/function/validInput.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/authWidget/customTextbody.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/customtexttitle.dart';
import 'package:newest/widgets/authWidget/textformfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.background,
          elevation: 0.0,
          title: Text(
            "ResetPassword",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: ListView(
            children: [
              const CustomTextTitleAuth(text: "New Password"),
              const SizedBox(
                height: 20,
              ),
              const CustomTextBodyAuth(text: "Please Enter new Password "),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  validinput: (val) {
                    return ValidInput(val!, 5, 40, "password");
                  },
                  // controller: controller.password,
                  label: "Password",
                  text: "Enter Your Password",
                  suffixicon: Icons.password_outlined),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                validinput: (val) {
                  return ValidInput(val!, 5, 40, "password");
                },
                controller: controller.repassword,
                label: "Repassword",
                text: "Enter Your RePassword ",
                suffixicon: Icons.password_outlined,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonAuth(
                text: " save ",
                onPressed: () {
                  controller.goToSuccessResetPassword();
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
