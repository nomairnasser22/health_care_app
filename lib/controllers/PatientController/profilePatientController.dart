import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newest/core/function/validUser.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';

abstract class ProfilePatientController extends GetxController {
  getuser();
  logout();
}

class ProfilePatientControllerImp extends ProfilePatientController {
  String? name;
  String? email;
  @override
  Future<QueryDocumentSnapshot?> getuser() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? emailUser = user!.email;

    if (await ValidUser(emailUser, "patients")) {
      QueryDocumentSnapshot? dataUser = await FindUser(emailUser, "patients");
      return dataUser;
    } else {
      QueryDocumentSnapshot? dataUser =
          await FindUser(emailUser, "MedicalStaff");
      return dataUser;
    }
  }

  @override
  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
  }
}
