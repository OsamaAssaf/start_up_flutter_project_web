import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../../resources/widgets/main_app_bar.dart';
import '../controller/connection_error_controller.dart';

class ConnectionErrorView extends StatelessWidget {
  ConnectionErrorView({super.key});

  final ConnectionErrorController connectionErrorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.connectionError,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            localizations.yourDeviceNotConnectedInternet,
            style: TextStyle(
              color: customTheme.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
