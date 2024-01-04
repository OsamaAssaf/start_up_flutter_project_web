import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../resources/managers/routes_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnection();
    });
    super.onInit();
  }

  Future<void> checkConnection() async {
    Get.toNamed(Routes.authRoute);
  }
}
