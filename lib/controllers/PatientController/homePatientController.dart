import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'dart:math';

abstract class HomePatientController extends GetxController {
  checkNearbyUsers();
}

class HomePatientControllerImp extends HomePatientController {
  List<QueryDocumentSnapshot> data = [];
  List<LocationData> otherUsersLocations = [];
  List<LocationData> nearbyUsers = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getLocations() async {
    List<LocationData> otherUsersLocations = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("patients").get();
    data = querySnapshot.docs;
    for (var item in data) {
      otherUsersLocations.add(LocationData.fromMap(
          {'latitude': item["latitude"], 'longitude': item["longitude"]}));
    }
    for (var i in otherUsersLocations) {
      print("the location is ");
      print(i);
    }
  }

  Future<bool> checkNearbyUsers() async {
    await getLocations();
    LocationData currentLocation = await getLocation();
    double maxDistance = 0.2;

    for (LocationData location in otherUsersLocations) {
      double? lat1 = currentLocation.latitude;
      double? lon1 = currentLocation.longitude;
      double? lat2 = location.latitude;
      double? lon2 = location.longitude;
      double distance = calculateDistance(lat1!, lon1!, lat2!, lon2!);
      if (distance <= maxDistance) {
        nearbyUsers.add(location);
      }
    }

    if (nearbyUsers.isNotEmpty) {
      print('there are nearby users');
      return true;
    } else {
      print("there aren't nearby users  ");
      return false;
    }
  }

  Future<LocationData> getLocation() async {
    Location location = Location();
    return await location.getLocation();
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Earth's radius in kilometers

    // Convert degrees to radians
    lat1 = _degreesToRadians(lat1);
    lon1 = _degreesToRadians(lon1);
    lat2 = _degreesToRadians(lat2);
    lon2 = _degreesToRadians(lon2);

    // Haversine formula
    double dlon = lon2 - lon1;
    double dlat = lat2 - lat1;

    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = earthRadius * c;

    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}
