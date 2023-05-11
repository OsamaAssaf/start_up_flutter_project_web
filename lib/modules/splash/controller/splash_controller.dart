import 'dart:async';

import 'package:get/get.dart';
import 'package:start_up_workspace/resources/routes_manager.dart';

class SplashController extends GetxController {
  Timer? timer;
  @override
  void onInit() {
    timer = Timer(const Duration(seconds: 2), () {
      Get.toNamed(Routes.authRoute);
    });
    super.onInit();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }
}
