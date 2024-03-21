import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:newest/controllers/AuthController/SignupController.dart';
import 'package:newest/controllers/AuthController/forgetPasswordController.dart';
import 'package:newest/controllers/AuthController/loginController.dart';
import 'package:newest/controllers/MedicalStaffController/homemedicalstaffController.dart';
import 'package:newest/controllers/MedicalStaffController/medicalStaffController.dart';
import 'package:newest/controllers/MedicalStaffController/profilemedicalController.dart';
import 'package:newest/controllers/MedicalStaffController/reprotmedicalstaffController.dart';
import 'package:newest/controllers/PatientController/homePatientController.dart';
import 'package:newest/controllers/PatientController/patientController.dart';
import 'package:newest/controllers/PatientController/profilePatientController.dart';
import 'package:newest/controllers/PatientController/reportPatientController.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => LoginControllerImp(), fenix: true);
    // Get.lazyPut(() => SingUpControllerImp(), fenix: true);
    // Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => MedicalStaffControllerImp(), fenix: true);
    Get.lazyPut(() => HomeMedicalStaffControllerImp(), fenix: true);
    Get.lazyPut(() => PatientControllerImp(), fenix: true);
    Get.lazyPut(() => ReportPatientControllerImp(), fenix: true);
    Get.lazyPut(() => ReporrtMedicalControllerImp(), fenix: true);
    Get.lazyPut(() => ProfileMedicalControllerImp(), fenix: true);
    Get.lazyPut(() => ProfilePatientControllerImp(), fenix: true);
    Get.lazyPut(() => HomePatientControllerImp(), fenix: true);
  }
}
