import '../../../resources/helpers/all_imports.dart';

class ConnectionErrorView extends StatelessWidget {
  ConnectionErrorView({super.key});

  final ConnectionErrorController connectionErrorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.connectionError,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            localizations.yourDeviceNotConnectedInternet,
            style: TextStyle(
              color: customTheme.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
