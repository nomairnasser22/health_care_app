import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newest/screens/AuthScreen/successResetPassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();

  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() {
    Get.to(SuccessResetPassword());
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
