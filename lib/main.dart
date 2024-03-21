import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newest/core/classes/mybinding.dart';
import 'package:newest/screens/MedicalStaffScreen/medicalStaffScreen.dart';
import 'package:newest/screens/PatientScreen/patientScreen.dart';
import 'package:newest/screens/WelcomeScreen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAJWWOEf23ZXY3NkzJO_MJAj3s4huBfFFA',
    projectId: 'healthyapp-d3cb0',
    messagingSenderId: '268367099804',
    appId: '1:268367099804:android:7f2e32dead68bb6eb83a59',
  ));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetStorage get = new GetStorage();
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(' = =========================User is currently signed out!');
        print("the status is ${get.read("status")}");
      } else {
        print('=====================User is signed in!');
        print("the status is ${get.read("status")}");
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            primaryContainer: Colors.blue, seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: get.read("status") == "patients"
          ? PatientScreen()
          : get.read("status") == "medical"
              ? MedicalStaffScreen()
              : WelcomeScreen(),
      initialBinding: Mybinding(),
    );
  }
}
