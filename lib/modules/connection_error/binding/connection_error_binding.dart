import 'package:get/get.dart';

import '../controller/connection_error_controller.dart';

class ConnectionErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ConnectionErrorController(),
    );
  }
}
