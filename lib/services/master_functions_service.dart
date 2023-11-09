import 'package:flutter/services.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../main.dart';

class MasterFunctionsService {
  MasterFunctionsService._();
  static final MasterFunctionsService instance = MasterFunctionsService._();
  Future<void> initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> initPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
