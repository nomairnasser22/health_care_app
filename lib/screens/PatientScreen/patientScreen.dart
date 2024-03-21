import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/PatientController/patientController.dart';
import 'package:newest/data/static/color.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  PatientControllerImp controller = Get.find<PatientControllerImp>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<PatientControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue.withOpacity(0.7),
                title: Text(
                  "Patient App ",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              body: controller.mypages.elementAt(controller.indexPage),
              drawer: Drawer(
                width: width * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListTile(
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                          onTap: () {
                            controller.changePage(0);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListTile(
                          leading: Icon(Icons.report),
                          title: Text("Report"),
                          onTap: () {
                            controller.changePage(1);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Profile"),
                          onTap: () {
                            controller.changePage(2);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
