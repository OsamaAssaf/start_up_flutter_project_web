import 'package:get/get.dart';

class Components {
  static void snackBar() {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
