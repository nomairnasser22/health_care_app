import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class HomeMedicalStaffController extends GetxController {
  changeStatus(String newValue);
  getdata();
}

class HomeMedicalStaffControllerImp extends HomeMedicalStaffController {
  List? PatientData;
  String? PatientName;
  String? PatientStatus;
  List? patients;
  List<QueryDocumentSnapshot> data = [];

  Future<List> getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("patients").get();
    data = querySnapshot.docs;
    // data.addAll(querySnapshot.docs);
    return data;
  }

  changestatus(status) {
    PatientStatus = status;
    update();
  }

  updataStatue(id) async {
    print("the id is $id");
    await FirebaseFirestore.instance
        .collection("patients")
        .doc(id)
        .update({"status": PatientStatus});
  }

  @override
  changeStatus(String? newValue) {
    PatientStatus = newValue;
    update();
  }

  @override
  void onInit() {
    // load the data form firebase
    super.onInit();
  }
}
