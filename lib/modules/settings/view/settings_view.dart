import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../../resources/widgets/main_app_bar.dart';
import '../controller/settings_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final SettingsController settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.settings,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [],
      ),
    );
  }
}
