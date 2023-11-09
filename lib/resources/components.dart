import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_plus/loading_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../main.dart';
import 'constants_manager.dart';
import 'theme/colors_manager.dart';

class Components {
  static void snackBar({
    required String message,
    SnackBarStatus snackBarStatus = SnackBarStatus.warning,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color? leftBarIndicatorColor;
    switch (snackBarStatus) {
      case SnackBarStatus.success:
        leftBarIndicatorColor = ColorsManager.success;
        break;
      case SnackBarStatus.error:
        leftBarIndicatorColor = ColorsManager.error;
        break;
      case SnackBarStatus.warning:
        leftBarIndicatorColor = ColorsManager.warning;
        break;
      default:
        leftBarIndicatorColor = null;
        break;
    }
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                height: 50.0,
                width: 4.0,
                color: leftBarIndicatorColor,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16.0),
                Text(message),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.zero,
        backgroundColor: ColorsManager.snackBarBackground,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showLoading() {
    LoadingPlus.instance.showCustom(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void dismissLoading() {
    LoadingPlus.instance.dismiss();
  }

  static bool isEnglish() {
    return Get.locale!.languageCode == ConstantsManager.englishLangValue;
  }

  static bool isDark() {
    return theme.colorScheme.brightness == Brightness.dark;
  }

  static SystemUiOverlayStyle systemUiOverlayStyle({Color? statusBarColor}) {
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor ?? theme.colorScheme.primary,
      statusBarBrightness: isDark() ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: isDark() ? Brightness.dark : Brightness.light,
    );
  }

  static Future<bool> checkConnection() {
    return InternetConnectionChecker().hasConnection;
  }

  static Future<CroppedFile?> cropImage(
      {required String path, bool isLogo = false}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: isLogo ? CropStyle.circle : CropStyle.rectangle,
      compressQuality: 100,
      compressFormat:
          isLogo ? ImageCompressFormat.png : ImageCompressFormat.jpg,
      aspectRatio: isLogo
          ? const CropAspectRatio(ratioX: 1, ratioY: 1)
          : const CropAspectRatio(ratioX: 16, ratioY: 9),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: localizations.chooseHowImageWillDisplayed,
          toolbarColor: theme.colorScheme.primary,
          toolbarWidgetColor: customTheme.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: localizations.chooseHowImageWillDisplayed,
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          aspectRatioPickerButtonHidden: true,
          resetButtonHidden: true,
        ),
      ],
    );
    return croppedFile;
  }

  static Future<TimeOfDay?> timePicker(BuildContext context,
      {TimeOfDay? initialTime}) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: initialTime ?? const TimeOfDay(hour: 8, minute: 0),
      helpText: localizations.chooseTheTime,
      builder: (context, child) {
        return Theme(
          data: isDark()
              ? ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.grey,
                  ),
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                    ),
                  ),
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: theme.colorScheme.background,
                    helpTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              : ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.grey,
                  ),
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                    ),
                  ),
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: theme.colorScheme.background,
                    helpTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
          child: child!,
        );
      },
    );
    return time;
  }

  static Future<DateTime?> datePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 90)),
      locale: Get.locale!,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: isDark()
              ? ThemeData.dark().copyWith(
                  dialogBackgroundColor: customTheme.white,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.black,
                  ),
                )
              : ThemeData.light().copyWith(
                  dialogBackgroundColor: customTheme.white,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.black,
                  ),
                ),
          child: child!,
        );
      },
    );
    return dateTime;
  }

  static Future<void> showAdaptiveDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
          );
        }
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  static Upgrader upgrader() {
    return Upgrader(
      messages: UpgraderMessages(
        code: Get.locale!.languageCode,
      ),
      debugDisplayAlways: false,
      debugLogging: false,
      shouldPopScope: () => false,
      showIgnore: false,
      showLater: false,
      canDismissDialog: false,
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      durationUntilAlertAgain: const Duration(minutes: 1),
    );
  }

  static String getMobileNumberWithCountryCode({
    required String phone,
    required String countryCode,
  }) {
    String phoneWithoutZero = phone;
    if (phoneWithoutZero[0] == '0') {
      phoneWithoutZero = phoneWithoutZero.replaceFirst('0', '');
    }
    return '$countryCode$phoneWithoutZero';
  }

  static void commonErrorSnackBar() {
    snackBar(
      message: localizations.somethingWrongTryAgain,
      snackBarStatus: SnackBarStatus.error,
    );
  }

  static Center loadingWidget() {
    return const Center(
        // child: LoadingAnimationWidget.staggeredDotsWave(
        //   color: theme.colorScheme.primary,
        //   size: 37.0,
        // ),
        );
  }
}

enum SnackBarStatus {
  success,
  error,
  warning,
  none,
}
