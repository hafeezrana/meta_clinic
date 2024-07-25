import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../views/widget/dialoguge.dart';

final mapServiceProvider = ChangeNotifierProvider<MapService>((ref) {
  return MapService();
});

class MapService extends ChangeNotifier {
  Position? currentPosition;
  List<Placemark> placemarks = [];

  Future<bool> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      await Geolocator.requestTemporaryFullAccuracy(purposeKey: 'Delivery');
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return MyDialogues.simpleCupertinoDialogue(
        context: Get.context!,
        title:
            "Location permissions are permanently denied, we cannot request permissions.",
        cancel: "Cancel",
        yes: "Ok",
        onYes: () {
          Navigator.pop(Get.context!);
        },
      );
    }

    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      notifyListeners();
      log('mylocation current: ${placemarks[0]} . ${currentPosition?.latitude}, ${currentPosition?.longitude}');
    } catch (e) {
      return Future.error(
          'Location services are disabled. Please enable to continue');
    }
    return serviceEnabled;
  }
}
