import 'package:flutter/material.dart';

import 'package:start_up_workspace/main.dart';
import 'package:start_up_workspace/resources/components.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.color,
    // this.textColor,
    this.border,
    this.smallButton = false,
  });

  final String text;
  final Widget? icon;
  final Function() onTap;
  final Color? color;
  // final Color? textColor;
  final BoxBorder? border;

  final bool smallButton;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTap,
      child: Ink(
        height: smallButton ? 40.0 : 50.0,
        width: smallButton ? width * 0.5 : width,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: color,
          gradient: color != null
              ? null
              : LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
          borderRadius: BorderRadius.circular(8.0),
          border: border,
        ),
        child: Stack(
          children: [
            Align(
              alignment: icon == null
                  ? Alignment.center
                  : Components.isEnglish()
                      ? Alignment.center
                      : Alignment.center,
              child: Text(
                text,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: customTheme.white,
                ),
              ),
            ),
            if (icon != null)
              Align(
                alignment: Components.isEnglish()
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Transform.flip(
                    flipY: Components.isEnglish() ? false : true,
                    child: RotatedBox(
                      quarterTurns: Components.isEnglish() ? 0 : 2,
                      child: icon,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
