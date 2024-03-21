import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class ReporrtMedicalController extends GetxController {
  getReport();
  deleteReport(id);
}

class ReporrtMedicalControllerImp extends ReporrtMedicalController {
  List<QueryDocumentSnapshot> data = [];

  @override
  Future<List> getReport() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("report").get();
    data = querySnapshot.docs;
    return data;
  }

  @override
  deleteReport(id) async {
    await FirebaseFirestore.instance.collection("report").doc(id).delete();
  }
}
