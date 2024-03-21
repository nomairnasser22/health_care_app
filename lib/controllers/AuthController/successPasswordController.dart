
import 'package:get/get.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';

abstract class SuccessPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessPasswordControllerImp extends SuccessPasswordController {
  @override
  goToPageLogin() {
    Get.offAll(const LoginScreen());
  }
}
