import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace/resources/assets_manager.dart';
import '../../../resources/routes_manager.dart';

import '../../../main.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(localizations.appName),
            accountEmail: const Text(''),
            currentAccountPicture: Image.asset(
              IconsManager.appIcon,
            ),
            currentAccountPictureSize: Size(width * 0.20, width * 0.20),
          ),
          ListTile(
            title: Text(
              localizations.settings,
            ),
            leading: const Icon(Icons.settings_outlined),
            onTap: () {
              Get.toNamed(Routes.settingsRoute);
            },
          ),
          ListTile(
            title: Text(
              localizations.aboutUs,
            ),
            leading: const Icon(Icons.info_outline),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  IconsManager.appIcon,
                  width: width * 0.20,
                  height: width * 0.20,
                ),
                applicationName: localizations.appName,
                applicationVersion: packageInfo.version,
                applicationLegalese: localizations.solutionsNow,
              );
            },
          ),
        ],
      ),
    );
  }
}
