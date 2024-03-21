import 'package:get/get.dart';
import 'package:newest/screens/AuthScreen/resetPassword.dart';


abstract class VerfiyCodePasswordController extends GetxController {
  checkCode();

  goToResetPassword();
}

class VerfiyCodePasswordControllerImp extends VerfiyCodePasswordController {
  late String code;

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.to(const ResetPasswordScreen());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
