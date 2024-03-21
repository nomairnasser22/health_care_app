import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/MedicalStaffController/reprotmedicalstaffController.dart';
import 'package:newest/widgets/MedicalStaffWidget/reportMedicalStaff.dart';

class ReportScreenMedicalScreen extends StatefulWidget {
  const ReportScreenMedicalScreen({super.key});

  @override
  State<ReportScreenMedicalScreen> createState() =>
      _ReportScreenMedicalScreenState();
}

class _ReportScreenMedicalScreenState extends State<ReportScreenMedicalScreen> {
  ReporrtMedicalControllerImp controller =
      Get.find<ReporrtMedicalControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 30, right: 10),
      child: FutureBuilder(
          future: controller.getReport(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var report = snapshot.data![index];
                  return ReportMedicalStaff(
                    id: report.id,
                    text: report["report"],
                    index: index,
                  );
                },
              );
            }
          }),
    );
    ;
  }
}
