import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/authWidget/customTextSignupOrSignIn.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/selectgender.dart';

import '../../controllers/AuthController/SignupController.dart';
import '../../core/function/validInput.dart';
import '../../widgets/authWidget/textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SingUpControllerImp controller = Get.put(SingUpControllerImp());

  @override
  void initState() {
    controller.formstate = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: width,
          child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.13,
                  ),
                  CustomTextFormField(
                    controller: controller.username,
                    keyboardType: TextInputType.name,
                    label: "Full Name",
                    text: "Enter Your Full Name ",
                    suffixicon: Icons.person_outline,
                    validinput: (val) {
                      return ValidInput(val!, 5, 40, "username");
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomTextFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    text: "Enter Your Eimal ",
                    suffixicon: Icons.email_outlined,
                    validinput: (val) {
                      return ValidInput(val!, 5, 40, "email");
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GetBuilder<SingUpControllerImp>(
                    init: SingUpControllerImp(),
                    builder: (controller) => CustomTextFormField(
                      obscuretext: controller.scuretextpassword,
                      ontap: () {
                        controller.onchangepassword();
                      },
                      controller: controller.password,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      text: "Enter Your Password ",
                      suffixicon: controller.scuretextpassword == true
                          ? Icons.lock_outline
                          : Icons.lock_open,
                      validinput: (val) {
                        return ValidInput(val!, 5, 40, "password");
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const Row(
                    children: [
                      Text("Select your gender :"),
                      SizedBox(
                        width: 10,
                      ),
                      SelectGender(),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select your gender :"),

                      GetBuilder<SingUpControllerImp>(
                        builder: (controller) => Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  10), // Optional: Adds padding inside the border
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26, // Border color
                              width: 2, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                5), // Optional: Rounds the corners of the border
                          ),
                          child: DropdownButton<String>(
                            value: controller.accounType,
                            onChanged: (String? newValue) {
                              controller.chooseType(newValue!);
                            },
                            underline: Container(),
                            items: <String>['Medical staff', 'Patient']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // DropdownMenu(
                      //     menuStyle: MenuStyle(),
                      //     // label: const Text("Medical staff"),
                      //     onSelected: (value) {
                      //       controller.accounType = value!;
                      //     },
                      //     dropdownMenuEntries: <DropdownMenuEntry<String>>[
                      //       DropdownMenuEntry(
                      //           value: "Medical staff", label: "Medical staff" , ),
                      //       DropdownMenuEntry(
                      //           value: "Patient", label: "Patient"),
                      //     ]),
                    ],
                  ),
                  // Text("Account type "),
                  // DropdownMenu(
                  //     label: const Text("Account type "),
                  //     onSelected: (value) {
                  //       controller.accounType = value!;
                  //     },
                  //     dropdownMenuEntries: <DropdownMenuEntry<String>>[
                  //       DropdownMenuEntry(
                  //           value: "Medical staff", label: "Medical staff"),
                  //       DropdownMenuEntry(value: "Patient", label: "Patient"),
                  //     ]),
                  SizedBox(
                    height: height * 0.14,
                  ),
                  CustomButtonAuth(
                      text: "SignUp",
                      onPressed: () {
                        controller.signUp(context);
                      }),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomTextSignUpOrSignIn(
                    text1: "have an accunt ?",
                    text2: " Sign In",
                    ontap: () => controller.goToSignIn(),
                  )
                ],
              ))),
    );
  }
}
