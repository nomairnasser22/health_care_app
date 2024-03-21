import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/AuthController/forgetPasswordController.dart';
import 'package:newest/core/function/validInput.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/authWidget/customTextbody.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/customtexttitle.dart';
import 'package:newest/widgets/authWidget/textformfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordControllerImp controller =
      Get.put<ForgetPasswordControllerImp>(ForgetPasswordControllerImp());
  @override
  void initState() {
    controller.formstate = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 120, 195, 249),
          elevation: 0.0,
          title: Text(
            "Forget Password",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const CustomTextTitleAuth(text: "Check Email"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextBodyAuth(
                    text:
                        "please Enter Your Email Address To Recive a verification code"),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  validinput: (val) {
                    return ValidInput(val!, 5, 40, "email");
                  },
                  // controller: controller.email,
                  label: "email",
                  text: "Enter Your Email ",
                  suffixicon: Icons.person_outline,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonAuth(
                  text: " Check ",
                  onPressed: () {
                    controller.checkemail(context);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
