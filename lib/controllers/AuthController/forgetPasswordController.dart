import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';
import 'package:newest/screens/AuthScreen/verfiyCodeScreen.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail(context);
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late GlobalKey<FormState> formstate;
  late TextEditingController email;
  GetStorage getStorage = new GetStorage();

  @override
  checkemail(context) async {
    if (formstate.currentState!.validate()) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        
        title: 'warning',
        desc: "Plaese Check Your  Email \n to reset password",
        btnCancel: null,
        btnOkColor: Colors.blue,
        btnOkOnPress: () {
          Get.offAll(LoginScreen());
        },
      ).show();
      // Get.to(LoginScreen());
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
