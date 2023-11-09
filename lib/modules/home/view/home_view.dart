import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import '../../../resources/components.dart';
import '../controller/home_controller.dart';
import '../widgets/home_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Components.upgrader(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const HomeDrawer(),
      ),
    );
  }
}
