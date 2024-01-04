import '../../../resources/helpers/all_imports.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 535,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<AuthController>(
                              builder: (controller) {
                                return Text(
                                  controller.authType == AuthType.login
                                      ? localizations.login
                                      : localizations.signUp,
                                  style: theme.textTheme.displayMedium,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetBuilder<AuthController>(
                                    builder: (controller) {
                                      if (controller.authType == AuthType.login) {
                                        return const SizedBox.shrink();
                                      }
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            localizations.email,
                                            style: theme.textTheme.displaySmall,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const TextField(),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    localizations.email,
                                    style: theme.textTheme.displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TextField(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    localizations.password,
                                    style: theme.textTheme.displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TextField(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MainButton(
                                        title: localizations.login,
                                        onPressed: () {
                                          _authController.submit();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          localizations.doNotHaveAnAccount,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        TextButton(
                                          onPressed: _authController.changeAuthType,
                                          child: Text(
                                            localizations.signUp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -253),
                      child: Image.asset(
                        IconsManager.appIcon,
                        width: width * 0.25,
                        height: width * 0.25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
