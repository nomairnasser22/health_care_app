import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/PatientController/patientController.dart';
import 'package:newest/controllers/PatientController/reportPatientController.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';
import 'package:newest/widgets/authWidget/textformfield.dart';

class ReportScreenMedicalScreen extends StatefulWidget {
  const ReportScreenMedicalScreen({super.key});

  @override
  State<ReportScreenMedicalScreen> createState() =>
      _ReportScreenMedicalScreenState();
}

class _ReportScreenMedicalScreenState extends State<ReportScreenMedicalScreen> {
  ReportPatientControllerImp controller =
      Get.find<ReportPatientControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 30, right: 10),
      child: Column(children: [
        Text(
          "Write Report ",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.grey.withOpacity(0.2),
          child: TextFormField(
            controller: controller.reporttext,
            maxLines: 10,
            minLines: 1,
            decoration: InputDecoration(
                hintText: "Write Your Report ",
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GetBuilder<ReportPatientControllerImp>(
            builder: (controller) => CustomButtonAuth(
                  onPressed: () {
                    controller.send();
                  },
                  text: "Sent",
                ))
      ]),
    );
  }
}
