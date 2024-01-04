import '../../../resources/helpers/all_imports.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.5,
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}
