import '../../../resources/helpers/all_imports.dart';

class SwitchItem extends StatelessWidget {
  const SwitchItem({
    super.key,
    required this.value,
    required this.title,
    this.leading,
    this.onChanged,
  });

  final bool value;
  final String title;
  final Widget? leading;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      title: ScaleText(
        title,
        style: theme.textTheme.titleLarge,
      ),
      secondary: leading,
      onChanged: onChanged,
      activeColor: theme.colorScheme.background,
      inactiveThumbColor: theme.colorScheme.primary,
      activeTrackColor: theme.colorScheme.primary,
      inactiveTrackColor: theme.disabledColor,
    );
  }
}
