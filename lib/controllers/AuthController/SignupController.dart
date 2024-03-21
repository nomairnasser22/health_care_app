import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';
import 'package:newest/screens/MedicalStaffScreen/medicalStaffScreen.dart';
import 'package:newest/screens/PatientScreen/patientScreen.dart';

abstract class SingUpController extends GetxController {
  signUp(context);

  goToSignIn();
  chooseType(value);

  genderValue(value);
}

class SingUpControllerImp extends SingUpController {
  late GlobalKey<FormState> formstate;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  bool scuretextconfirmpassword = true;
  bool scuretextpassword = true;
  late String? gender = "Male";
  late String accounType = "Patient";
  FirebaseAuth _auth = FirebaseAuth.instance;
  String status = "Healthy";
  List data = [];
  GetStorage? getStorage = GetStorage();
  Map? location;

  chooseType(value) {
    accounType = value;
    update();
  }

  @override
  goToSignIn() {
    Get.off(() => LoginScreen());
  }

  onchangepassword() {
    scuretextpassword = scuretextpassword == true ? false : true;
    print(scuretextpassword);
    update();
  }

  onchangeconfirmpassword() {
    scuretextconfirmpassword = scuretextconfirmpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    formstate = GlobalKey<FormState>();
    location = getStorage!.read("location");
    super.onInit();
  }

  @override
  signUp(context) async {
    if (formstate.currentState!.validate()) {
      print("The location is $location");
      print("----------------------------------------------------------------");
      try {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        if (accounType == "Patient") {
          print("---------------------- I'm patient -------------------");
          if (credential.user != null) {
            CollectionReference Patients =
                FirebaseFirestore.instance.collection('patients');
            Patients.add({
              "status": status,
              "accountType": accounType,
              "email": email.text,
              "password": password.text,
              "gender": gender,
              "latitude": location!["latitude"],
              "longitude": location!["longitude"],
              "name": username.text
            })
                .then((value) =>
                    print("the process is success --------------------"))
                .onError(
                    (error, stackTrace) => print("there is error : $error"));
            print("---------------------- I'm in database -------------------");
            getStorage?.write("status", "patients");
            Get.offAll(PatientScreen());
          }
        } else {
          print(" ---------------- I'm Medical --------------");

          CollectionReference MedicalStaff =
              FirebaseFirestore.instance.collection('MedicalStaff');
          MedicalStaff.add({
            "accountType": accounType,
            "email": email.text,
            "password": password.text,
            "gender": gender,
            "latitude": location!["latitude"],
            "longitude": location!["longitude"],
            "name": username.text
          })
              .then((value) =>
                  print("the process is success --------------------"))
              .onError((error, stackTrace) => print("there is error : $error"));
          print("---------------------- I'm in database -------------------");
          getStorage?.write("status", "medical");
          Get.offAll(MedicalStaffScreen());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print(
              'The password provided is too weak. -----------------------------------------');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Eror',
            desc: 'The password provided is too weak.',
            btnOkColor: Colors.blue,
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'email-already-in-use') {
          print(
              'The account already exists for that email.-------------------------------------');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Eror',
            desc: 'The account already exists for that email',
            btnCancelOnPress: () {},
            btnOkColor: Colors.blue,
            btnOkOnPress: () {},
          ).show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("error");
    }
  }

  @override
  genderValue(value) {
    gender = value;
    update();
  }
}
