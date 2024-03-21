import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/screens/PatientScreen/homePatientScreen.dart';
import 'package:newest/screens/PatientScreen/profilePatientScreen.dart';
import 'package:newest/screens/PatientScreen/reportPatientScreen.dart';

abstract class PatientController extends GetxController {
  changePage(int index);
}

class PatientControllerImp extends PatientController {
  int indexPage = 0;
  List<Widget> mypages = [
    HomeScreenPatient(),
    ReportScreenMedicalScreen(),
    ProfileScreenPatient()
  ];
  @override
  changePage(int index) {
    indexPage = index;
    update();
  }
}
