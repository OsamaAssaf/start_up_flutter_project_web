import 'package:flutter/material.dart';

import '../../main.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    this.title,
    this.titleWidget,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.buttonWidth,
    this.borderSide,
    this.elevation,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? color;
  final double? buttonWidth;
  final BorderSide? borderSide;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: borderSide ?? BorderSide.none,
          ),
          elevation: elevation,
          surfaceTintColor: Colors.transparent,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          minimumSize: Size(width * 0.75, 46.0),
          maximumSize: Size(width, 46.0),
          fixedSize: buttonWidth == null ? Size(width, 46.0) : null,
        ),
        onPressed: onPressed,
        child: titleWidget ??
            Text(
              title!,
              style: TextStyle(
                fontSize: 16.0,
                color: color ?? customTheme.white,
              ),
            ),
      ),
    );
  }
}
