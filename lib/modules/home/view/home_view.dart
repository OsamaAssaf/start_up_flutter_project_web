import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../widgets/drawer_home.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerHome(),
    );
  }
}
