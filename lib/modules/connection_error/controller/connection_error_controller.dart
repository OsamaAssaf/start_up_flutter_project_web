import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/components.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/widgets/main_button.dart';

class ConnectionErrorController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.bottomSheet(
        WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
            height: 280.0,
            width: Get.width,
            child: Container(
              height: 280.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (Get.width * 0.70) - 16.0,
                        child: Column(
                          children: [
                            Text(
                              localizations.connectionFailedConnectServer,
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: customTheme.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              localizations.pleaseCheckYourConnectionTryAgain,
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: customTheme.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      SvgPicture.asset(
                        ImagesAssets.connectionErrorSvg,
                        width: (Get.width * 0.30) - 24.0,
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  MainButton(
                    title: localizations.retry,
                    onPressed: () {
                      checkConnection();
                    },
                  ),
                  const SizedBox(height: 4.0),
                  MainButton(
                    title: localizations.close,
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    backgroundColor: customTheme.white,
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        enableDrag: false,
        isDismissible: false,
      );
    });
    super.onInit();
  }

  Future<void> checkConnection() async {
    Components.showLoading();
    final bool result = await Components.checkConnection();
    await Future.delayed(const Duration(milliseconds: 300));
    Components.dismissLoading();
    if (result == true) {
      Get.offAllNamed(Routes.splashRoute);
    }
  }
}
