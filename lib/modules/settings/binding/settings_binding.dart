import '../../../resources/helpers/all_imports.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingsController(),
    );
  }
}
