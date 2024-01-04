import '../../../resources/helpers/all_imports.dart';

class ConnectionErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ConnectionErrorController(),
    );
  }
}
