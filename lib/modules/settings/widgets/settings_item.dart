import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../resources/widgets/scale_text.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
  });
  final String title;
  final void Function()? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ScaleText(
        title,
        style: theme.textTheme.titleLarge,
      ),
      leading: leading,
      trailing: onTap != null
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.0,
              color: theme.colorScheme.primary,
            )
          : null,
      onTap: onTap,
    );
  }
}
