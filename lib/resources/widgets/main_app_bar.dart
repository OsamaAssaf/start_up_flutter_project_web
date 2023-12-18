import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../components.dart';
import '../managers/assets_manager.dart';
import '../managers/constants_manager.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.canBack = false,
    this.actions,
  });

  final String title;
  final bool canBack;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(ConstantsManager.appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Components.systemUiOverlayStyle(),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: theme.colorScheme.primary,
        ),
      ),
      leading: canBack
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: RotatedBox(
                quarterTurns: Components.isRTL() ? 2 : 0,
                child: SvgPicture.asset(
                  IconsManager.backButtonSvg,
                  height: 22.0,
                  width: 22.0,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: theme.colorScheme.primary,
          height: 1.0,
        ),
      ),
      actions: actions,
    );
  }
}
