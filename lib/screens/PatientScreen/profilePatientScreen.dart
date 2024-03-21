import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/PatientController/profilePatientController.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';

class ProfileScreenPatient extends StatefulWidget {
  const ProfileScreenPatient({super.key});

  @override
  State<ProfileScreenPatient> createState() => _ProfileScreenPatientState();
}

class _ProfileScreenPatientState extends State<ProfileScreenPatient> {
  ProfilePatientControllerImp controller =
      Get.find<ProfilePatientControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 30, right: 10),
      child: Scaffold(
        body: FutureBuilder(
            future: controller.getuser(),
            builder: (context, snapshot) {
              var user = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize: 25),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${user?["name"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Text("${user?["email"]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          controller.logout();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.black87.withOpacity(0.15))),
                          child: Text(
                            "Log Out ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]);
              }
            }),
      ),
    );
  }
}
