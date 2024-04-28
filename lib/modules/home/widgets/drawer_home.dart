import '../../../resources/helpers/all_imports.dart';
import '../../../resources/helpers/conflict_imports.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Drawer(
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.colorScheme.background,
        width: 260.0,
        semanticLabel: 'Navigation Menu',
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                arrowColor: theme.colorScheme.background,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                margin: const EdgeInsets.all(0.0),
                accountName: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
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
              // ListTile(
              //   title: Text(
              //     localizations.rateApp,
              //     style: theme.textTheme.titleLarge!.copyWith(
              //       color: customTheme.black,
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              //   leading: Icon(
              //     Icons.star_border_rounded,
              //     color: customTheme.black,
              //   ),
              //   onTap: rateApp,
              // ),
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
                onTap: _shareApp,
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
                onTap: _sendFeedback,
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
                onTap: _openTermsAndConditions,
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
                  Get.toNamed(Routes.settingsRoute);
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
                onTap: () {
                  _logoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareApp() async {
    try {
      Components().showLoading();
      await Share.share(ConstantsManager.shareText);
    } catch (_) {
      Components().snackBar(message: localizations.somethingWrongTryAgain);
    } finally {
      Components().dismissLoading();
    }
  }

  Future<void> _sendFeedback() async {
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
                child: MainTextField(
                  controller: feedbackController,
                  minLines: 1,
                  maxLines: 5,
                  hint: localizations.writeHere,
                  validator: ValidatorsManager().validateNotEmpty,
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

  Future<void> _openTermsAndConditions() async {
    try {
      Components().showLoading();
      await launchUrl(
        Uri.parse(ConstantsManager.termsAndConditionsUrl),
        mode: LaunchMode.externalApplication,
      );
      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      Components().snackBar(message: localizations.somethingWrongTryAgain);
    }
  }

  Future<void> _logoutDialog(BuildContext context) async {
    final ScaleText title = ScaleText(
      localizations.logOut,
      isFromDialog: true,
    );
    final ScaleText content = ScaleText(
      localizations.areYouSureLogOut,
      style: theme.textTheme.titleMedium!.copyWith(
        color: customTheme.error,
      ),
      isFromDialog: true,
    );
    final List<Widget> actions = [
      TextButton(
        onPressed: () {
          Get.offAllNamed(Routes.splashRoute);
        },
        child: ScaleText(
          localizations.yes,
          style: theme.textTheme.titleLarge,
          isFromDialog: true,
        ),
      ),
      FilledButton(
        onPressed: () {
          Get.back();
        },
        child: ScaleText(
          localizations.no,
          style: theme.textTheme.titleLarge,
          isFromDialog: true,
        ),
      ),
    ];
    Components().showAdaptiveDialog(
      context: context,
      title: title,
      content: content,
      actions: actions,
    );
  }
}
