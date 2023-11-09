import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:start_up_workspace/main.dart';
import 'package:start_up_workspace/resources/assets_manager.dart';
import 'package:start_up_workspace/resources/validators.dart';
import 'package:start_up_workspace/resources/widgets/can_use/underline_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/components.dart';
import '../../../resources/constants_manager.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Drawer(
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.colorScheme.background,
        width: 260.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                arrowColor: theme.colorScheme.background,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                margin: const EdgeInsets.all(0.0),
                accountName: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: Text(
                    'User Name',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.background,
                    ),
                  ),
                ),
                accountEmail: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: Text(
                    'user@example.com',
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.background,
                    ),
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: theme.colorScheme.background,
                    child: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      radius: 34,
                      child: Image.asset(
                        IconsManager.appIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  localizations.aboutUs,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: customTheme.black,
                ),
                onTap: () {
                  // Get.toNamed(Routes.aboutUsRoute);
                },
              ),
              ListTile(
                title: Text(
                  localizations.rateApp,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.star_border_rounded,
                  color: customTheme.black,
                ),
                onTap: rateApp,
              ),
              ListTile(
                title: Text(
                  localizations.inviteFriend,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.share_outlined,
                  color: customTheme.black,
                ),
                onTap: shareApp,
              ),
              ListTile(
                title: Text(
                  localizations.feedback,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.feedback_outlined,
                  color: customTheme.black,
                ),
                onTap: sendFeedback,
              ),
              ListTile(
                title: Text(
                  localizations.termsAndConditions,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: customTheme.black,
                ),
                onTap: openTermsAndConditions,
              ),
              ListTile(
                title: Text(
                  localizations.settings,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.settings_suggest_outlined,
                  color: customTheme.black,
                ),
                onTap: () {
                  // Get.toNamed(Routes.settingRoute);
                },
              ),
              ListTile(
                title: Text(
                  localizations.logOut,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: customTheme.black,
                ),
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> shareApp() async {
    try {
      Components.showLoading();
      await Share.share(ConstantsManager.shareText);
    } catch (_) {
      Components.snackBar(message: localizations.somethingWrongTryAgain);
    } finally {
      Components.dismissLoading();
    }
  }

  Future<void> rateApp() async {
    try {
      Components.showLoading();
      final InAppReview inAppReview = InAppReview.instance;

      await inAppReview.openStoreListing(
        appStoreId: DotenvManager.appStoreId,
      );
      Components.dismissLoading();
    } catch (_) {
      Components.dismissLoading();
      Components.snackBar(message: localizations.somethingWrongTryAgain);
    }
  }

  Future<void> sendFeedback() async {
    final TextEditingController feedbackController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: AlertDialog(
          backgroundColor: theme.colorScheme.background,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          titlePadding: const EdgeInsets.only(top: 8.0),
          insetPadding: const EdgeInsets.all(8.0),
          title: Image.asset(
            IconsManager.appIcon,
            height: 70.0,
            width: 70.0,
            fit: BoxFit.contain,
          ),
          contentPadding: const EdgeInsets.all(8.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8.0),
              Center(
                child: Text(
                  localizations.sendYourFeedback,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Form(
                key: formKey,
                child: UnderlineTextField(
                  controller: feedbackController,
                  minLines: 1,
                  maxLines: 5,
                  hint: localizations.writeHere,
                  validator: Validators.validateFeedback,
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.0,
                ),
              ),
              child: Text(
                localizations.send,
                style: theme.textTheme.titleLarge,
              ),
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                // final FeedbackRepository feedbackRepository = FeedbackApi();
                // try {
                //   Components.showLoading();
                //   await feedbackRepository
                //       .sendFeedback(feedbackController.text.trim());
                //   Components.dismissLoading();
                //   Get.back();
                //   Components.snackBar(
                //     message: localizations.feedbackSent,
                //     snackBarStatus: SnackBarStatus.success,
                //   );
                // } catch (_) {
                //   Components.dismissLoading();
                //   Components.snackBar(
                //       message: localizations.somethingWrongTryAgain);
                // }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openTermsAndConditions() async {
    try {
      Components.showLoading();
      await launchUrl(
        Uri.parse(ConstantsManager.termsAndConditionsUrl),
        mode: LaunchMode.externalApplication,
      );
      Components.dismissLoading();
    } catch (_) {
      Components.dismissLoading();
      Components.snackBar(message: localizations.somethingWrongTryAgain);
    }
  }

  Future<void> logout() async {
    Components.showAlertDialog(
      title: localizations.logOut,
      content: Text(
        localizations.areYouSureLogOut,
        style: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.error,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            // Get.offAllNamed(Routes.welcomeRoute);
            // await SharedPrefs.instance.clearUserData();
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            localizations.yes,
            style: theme.textTheme.titleLarge,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Get.back();
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            localizations.no,
            style: theme.textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
