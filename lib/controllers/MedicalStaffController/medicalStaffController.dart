import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/screens/MedicalStaffScreen/homeMedicalStaffScreen.dart';
import 'package:newest/screens/MedicalStaffScreen/profileMedicalStaffScreen.dart';
import 'package:newest/screens/MedicalStaffScreen/reportMedicalStaffScreen.dart';

abstract class MedicalStaffController extends GetxController {
  changePage(int index);
}

class MedicalStaffControllerImp extends MedicalStaffController {
  int indexPage = 0;
  var patients;
  List<Widget> mypages = [
    HomeScreenMedicalStaff(),
    ReportScreenMedicalScreen(),
    ProfileScreenMedicalStaff()
  ];
  @override
  changePage(int index) {
    indexPage = index;
    update();
  }
  }


