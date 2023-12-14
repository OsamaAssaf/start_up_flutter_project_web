// import 'package:flutter/material.dart';
//
// import 'package:flutter_svg/svg.dart';
//
// import '../../assets_manager.dart';
// import 'border_text_field.dart';
//
// class SearchTextField extends StatelessWidget {
//   const SearchTextField({
//     super.key,
//     this.onChanged,
//     this.onFieldSubmitted,
//   });
//
//   final void Function(String?)? onChanged;
//   final void Function(String?)? onFieldSubmitted;
//
//   @override
//   Widget build(BuildContext context) {
//     return BorderTextField(
//       label: 'search',
//       textInputAction: TextInputAction.search,
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       prefixIcon: SvgPicture.asset(
//         IconsManager.searchSvg,
//         height: 20.0,
//         width: 20.0,
//       ),
//     );
//   }
// }
