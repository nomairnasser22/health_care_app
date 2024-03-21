import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newest/data/static/color.dart';
import 'package:location/location.dart';
import 'package:newest/screens/AuthScreen/loginScreen.dart';
import 'package:newest/screens/AuthScreen/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GetStorage? getStorage =  GetStorage();
  sendLocation(context) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
     Map<String, dynamic> locationDataMap = {
      'latitude': _locationData.latitude,
      'longitude': _locationData.longitude,
    };
    print(_locationData);
    getStorage!.write("location", locationDataMap);
    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorApp.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              FutureBuilder(
                  future: sendLocation(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data != null) {
                        Future.delayed(Duration(seconds: 1), () {
                          Get.to(() => SignUpScreen());
                        });
                      }
                    }
                    return CircularProgressIndicator();
                  }),
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                width: width,
                child: Text(
                  "HEALTHCARE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Spacer(),
            ],
          )),
    );
  }
}
