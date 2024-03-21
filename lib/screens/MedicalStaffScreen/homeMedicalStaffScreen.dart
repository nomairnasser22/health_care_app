import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/MedicalStaffController/homemedicalstaffController.dart';
import 'package:newest/widgets/MedicalStaffWidget/listTilePatient.dart';

class HomeScreenMedicalStaff extends StatefulWidget {
  const HomeScreenMedicalStaff({super.key});

  @override
  State<HomeScreenMedicalStaff> createState() => _HomeScreenMedicalStaffState();
}

class _HomeScreenMedicalStaffState extends State<HomeScreenMedicalStaff> {
  HomeMedicalStaffControllerImp controller =
      Get.find<HomeMedicalStaffControllerImp>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 30, right: 10),
      child: Center(
        child: FutureBuilder(
            future: controller.getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var patient = snapshot.data![index];
                    print(" the type patient is ${patient}");
                    return ListTilePatient(
                        id: snapshot.data![index].id,
                        patientName: patient["name"]);
                  },
                );
              }
            }),
      ),
    );
  }
}
