import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_plus/loading_plus.dart';

class Components {
  static void snackBar() {
    Get.showSnackbar(
      const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
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

  static void showLoading() {
    LoadingPlus.instance.showCustom(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void dismissLoading() {
    LoadingPlus.instance.dismiss();
  }
}
