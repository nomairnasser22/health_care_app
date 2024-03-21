import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newest/core/function/validUser.dart';
import 'package:newest/screens/AuthScreen/forgetpassword.dart';
import 'package:newest/screens/AuthScreen/signup_screen.dart';
import 'package:newest/screens/MedicalStaffScreen/medicalStaffScreen.dart';
import 'package:newest/screens/PatientScreen/patientScreen.dart';

abstract class LoginController extends GetxController {
  onChangePassword();

  login(context);

  goToSignup();

  goToForgetPasswordScreen();
}

class LoginControllerImp extends LoginController {
  late GlobalKey<FormState> formstate;
  late TextEditingController email;
  late TextEditingController password;
  bool scuretextpassword = true;
  GetStorage getStorage = new GetStorage();

  // @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    email.clear();
    password.clear();
    super.onClose();
  }

  @override
  login(context) async {
    print("I'm in login medtho ----------------");
    if (formstate.currentState!.validate()) {
      try {
        print("I will login now  ----------------");
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        String? emailuser = credential.user!.email;
        if (await ValidUser(emailuser, "patients")) {
          getStorage.write("status", "patients");
          Get.to(PatientScreen());
        } else {
          getStorage.write("status", "medical");
          Get.to(MedicalStaffScreen());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          print('No user found for that email.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'No user found for that email.',
            btnCancelOnPress: () {},
            btnOkColor: Colors.blue,
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Eror',
            desc: "Wrong password provided for that user.",
            btnCancelOnPress: () {},
            btnOkColor: Colors.blue,
            btnOkOnPress: () {},
          ).show();
        } else {
          print(" the Error is ${e.code}");
        }
      }
    } else {
      print("no");
    }
  }

  @override
  onChangePassword() {
    scuretextpassword = scuretextpassword == true ? false : true;
    update();
  }

  @override
  goToSignup() {
    Get.off(() => SignUpScreen());
  }

  @override
  goToForgetPasswordScreen() {
    Get.to(()=>ForgetPasswordScreen());
  }
}
