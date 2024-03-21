import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/core/function/validUser.dart';
import 'package:newest/screens/AuthScreen/signup_screen.dart';
import 'package:newest/screens/MedicalStaffScreen/medicalStaffScreen.dart';
import 'package:newest/screens/PatientScreen/patientScreen.dart';

abstract class MainController extends GetxController {
  toWhere();
}

class MainControllerImp extends MainController {
  Widget? Screen ;
  @override
  Future<Widget?> toWhere() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (await ValidUser(user?.email, "patients")) {
      return PatientScreen();
    } else if (await ValidUser(user?.email, "MedicalStaff")) {
      return MedicalStaffScreen();
    } else {
      return SignUpScreen();
    }
  }
}
