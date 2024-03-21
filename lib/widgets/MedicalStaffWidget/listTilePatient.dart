import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/MedicalStaffController/homemedicalstaffController.dart';

class ListTilePatient extends StatelessWidget {
  ListTilePatient({
    super.key,
    required this.id,
    required this.patientName,
  });

  final String patientName;
  final dynamic id;
  HomeMedicalStaffControllerImp contrller =
      Get.find<HomeMedicalStaffControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GetBuilder<HomeMedicalStaffControllerImp>(
        builder: (controller) => ListTile(
            trailing: DropdownButton<String>(
              value: "Healthy",
              onChanged: (String? newValue) {
                controller.changeStatus(newValue);
                controller.updataStatue(id);
              },
              underline: Container(),
              items: <String>['Patient', 'Healthy']
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
            //  DropdownMenu(
            //     onSelected: (value) {
            //       controller.changeStatus(value);
            //       controller.updataStatue(id);
            //     },
            //     initialSelection: "Healthy",
            //     dropdownMenuEntries: [
            //       const DropdownMenuEntry(label: "Healthy", value: "Healthy"),
            //       const DropdownMenuEntry(label: "Patient", value: "Patient"),
            //     ]),
            title: Text(patientName)),
      ),
    );
  }
}
