import '../../../resources/helpers/all_imports.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width * 0.25,
            maxHeight: width * 0.25,
          ),
          child: Image.asset(
            IconsManager.appIcon,
          ),
        ),
      ),
    );
  }
}
