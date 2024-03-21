import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/AuthController/successPasswordController.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/authWidget/custombuttomAuth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPasswordControllerImp controller =
        Get.put(SuccessPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.background,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ColorApp.primaryColor,
              )),
              Text(
                "congratulaions",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              CustomButtonAuth(
                text: " Go To Login ",
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ]),
      ),
    );
  }
}
