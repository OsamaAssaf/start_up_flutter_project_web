// import 'package:flutter/material.dart';
//
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../../main.dart';
// import '../../assets_manager.dart';
// import '../../components.dart';
//
// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MainAppBar({
//     Key? key,
//     required this.title,
//     this.canBack = false,
//     this.actions,
//     this.bottom,
//     this.haveTabBottom = false,
//     this.hasFittedBox = false,
//   }) : super(key: key);
//
//   final String title;
//   final bool canBack;
//   final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;
//   final bool haveTabBottom;
//   final bool hasFittedBox;
//
//   @override
//   Size get preferredSize => Size.fromHeight(haveTabBottom ? 108.0 : 60.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: theme.colorScheme.background,
//       foregroundColor: theme.colorScheme.primary,
//       elevation: 0.0,
//       scrolledUnderElevation: 0.0,
//       title: hasFittedBox
//           ? FittedBox(
//               child: Text(
//                 title,
//                 style: theme.textTheme.displayMedium,
//               ),
//             )
//           : Text(
//               title,
//               style: theme.textTheme.displayMedium,
//             ),
//       centerTitle: true,
//       leading: canBack
//           ? IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: RotatedBox(
//                 quarterTurns: !Components.isEnglish() ? 2 : 0,
//                 child: SvgPicture.asset(
//                   IconsManager.backButtonSvg,
//                   height: 20.0,
//                   width: 20.0,
//                 ),
//               ),
//             )
//           : null,
//       // automaticallyImplyLeading: false,
//       bottom: haveTabBottom
//           ? bottom
//           : PreferredSize(
//               preferredSize: const Size.fromHeight(1.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     color: theme.colorScheme.primary,
//                     width: Get.width * 0.33,
//                     height: 1.0,
//                   ),
//                   Container(
//                     color: theme.colorScheme.primary,
//                     width: Get.width * 0.33,
//                     height: 1.0,
//                   ),
//                 ],
//               ),
//             ),
//       actions: actions,
//     );
//   }
// }
