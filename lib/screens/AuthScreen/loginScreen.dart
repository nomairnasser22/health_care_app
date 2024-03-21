import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/AuthController/loginController.dart';
import 'package:newest/core/function/validInput.dart';
import 'package:newest/widgets/authWidget/customTextSignupOrSignIn.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/textLink.dart';
import 'package:newest/widgets/authWidget/textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // LoginControllerImp controller = Get.find<LoginControllerImp>();
  LoginControllerImp controller =
      Get.put<LoginControllerImp>(LoginControllerImp());
  @override
  void initState() {
    controller.formstate = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.13,
                ),
                CustomTextFormField(
                    label: "Email",
                    text: "Enter your Email",
                    suffixicon: Icons.email_outlined,
                    controller: controller.email,
                    validinput: (p0) => ValidInput(p0!, 5, 40, "email"),
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: height * 0.05,
                ),
                GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomTextFormField(
                        obscuretext: controller.scuretextpassword,
                        ontap: () => controller.onChangePassword(),
                        label: "Password",
                        text: "Enter your Password",
                        suffixicon: controller.scuretextpassword == true
                            ? Icons.lock_outline
                            : Icons.lock_open_outlined,
                        controller: controller.password,
                        validinput: (p0) => ValidInput(p0!, 5, 40, "password"),
                        keyboardType: TextInputType.visiblePassword)),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: TextButton(
                      onPressed: () {
                        controller.goToForgetPasswordScreen();
                      },
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                CustomButtonAuth(
                    text: "LogIn",
                    onPressed: () {
                      controller.login(context);
                    }),
                SizedBox(
                  height: height * 0.19,
                ),
                CustomTextSignUpOrSignIn(
                    text1: "Don't hava an account ? ",
                    text2: " Sign Up",
                    ontap: () {
                      controller.goToSignup();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
