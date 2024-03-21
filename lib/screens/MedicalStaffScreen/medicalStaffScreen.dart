import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/MedicalStaffController/medicalStaffController.dart';
import 'package:newest/data/static/color.dart';
import 'package:newest/widgets/MedicalStaffWidget/iconbuttonNavBar.dart';

class MedicalStaffScreen extends StatefulWidget {
  const MedicalStaffScreen({super.key});

  @override
  State<MedicalStaffScreen> createState() => _MedicalStaffScreenState();
}

class _MedicalStaffScreenState extends State<MedicalStaffScreen> {
  MedicalStaffControllerImp contrller = Get.find<MedicalStaffControllerImp>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<MedicalStaffControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.background,
          title: Text(
            "Medical Staff App",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: contrller.mypages.elementAt(controller.indexPage),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconBottomNavBar(
                iconData: Icons.home,
                ontab: () => controller.changePage(0),
                selected: contrller.indexPage == 0 ? true : false,
              ),
              IconBottomNavBar(
                  iconData: Icons.report,
                  ontab: () => controller.changePage(1),
                  selected: contrller.indexPage == 1 ? true : false),
              IconBottomNavBar(
                  iconData: Icons.person,
                  ontab: () => controller.changePage(2),
                  selected: contrller.indexPage == 2 ? true : false),
            ],
          ),
        ),
      ),
    ));
  }
}
