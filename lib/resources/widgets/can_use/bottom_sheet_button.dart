import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:start_up_workspace/main.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 8.0,
    this.topBorder,
    this.bottomBorder,
    this.allBorder,
  });

  final String text;
  final Function() onPressed;
  final Color? color;
  final double borderRadius;
  final bool? topBorder;
  final bool? bottomBorder;
  final bool? allBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: customTheme.white,
        borderRadius: allBorder == true
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.only(
                topLeft: topBorder == true
                    ? const Radius.circular(8.0)
                    : Radius.zero,
                topRight: topBorder == true
                    ? const Radius.circular(8.0)
                    : Radius.zero,
                bottomLeft: bottomBorder == true
                    ? const Radius.circular(8.0)
                    : Radius.zero,
                bottomRight: bottomBorder == true
                    ? const Radius.circular(8.0)
                    : Radius.zero,
              ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
