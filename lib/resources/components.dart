import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Components {
  static void snackBar() {
    Get.showSnackbar(
     const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        duration:  Duration(seconds: 3),
      ),
    );
  }

    static void loading() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
    );
  }
  
  
//   Future<bool> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Get.defaultDialog(
//         title: 'Location Service Disabled',
//         middleText: 'Go to Settings And Enable Location Service.',
//         actions: [
//           TextButton(
//             onPressed: () async {
//               Get.back();
//               await Geolocator.openLocationSettings();
//             },
//             child: const Text('Open Location Settings'),
//           ),
//         ],
//       );

//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         Get.defaultDialog(
//           title: 'Location Permission Denied',
//           middleText:
//               'Go to Settings > Apps > Loyalty User > Permissions.\n\nAnd Enable Location Service.',
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 Get.back();
//                 await Geolocator.openAppSettings();
//               },
//               child: const Text('Open Settings'),
//             ),
//           ],
//         );
//         return false;
//       }
//       if (permission == LocationPermission.denied) {
//         return false;
//       }
//     }

//     currentPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     return true;
//   }

  
  
}
