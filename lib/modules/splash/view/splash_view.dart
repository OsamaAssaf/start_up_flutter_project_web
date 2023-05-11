import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace/modules/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});

  final SplashController _splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
