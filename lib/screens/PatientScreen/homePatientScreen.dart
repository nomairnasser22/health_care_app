import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/PatientController/homePatientController.dart';
import 'package:newest/widgets/PatientWidget/map.dart';

class HomeScreenPatient extends StatefulWidget {
  const HomeScreenPatient({super.key});

  @override
  State<HomeScreenPatient> createState() => _HomeScreenPatientState();
}

class _HomeScreenPatientState extends State<HomeScreenPatient> {
  HomePatientControllerImp controller =
      Get.put<HomePatientControllerImp>(HomePatientControllerImp());
  bool showMap = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.6,
      child: showMap
          ? Center(
              child: MaterialButton(
              onPressed: () {
                controller.getLocations();
              },
              child: Text(
                "Health Care App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ))
          : const Map(),
    );
  }
}
