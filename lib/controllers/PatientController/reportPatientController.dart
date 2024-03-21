import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

abstract class ReportPatientController extends GetxController {
  send();

}

class ReportPatientControllerImp extends ReportPatientController {
  late TextEditingController reporttext;

  @override
  void onInit() {
    // TODO: implement onInit
    reporttext = TextEditingController();
    super.onInit();
  }

  @override
  send() async {
    CollectionReference Patients =
        FirebaseFirestore.instance.collection('report');
    Patients.add({
      "report":reporttext.text
    })
        .then((value) => print("the process is success --------------------"))
        .onError((error, stackTrace) => print("there is error : $error"));
            
    reporttext.clear();
  }
}
