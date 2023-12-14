// import 'package:flutter/material.dart';
//
// import '../../../main.dart';
// import '../../components.dart';
//
// class NumberPickerForm extends StatelessWidget {
//   const NumberPickerForm({
//     super.key,
//     this.controller,
//     this.label,
//     this.prefixIcon,
//     this.validator,
//     required this.number,
//     required this.onIncrease,
//     required this.onDecrease,
//   });
//
//   final TextEditingController? controller;
//   final String? label;
//   final Widget? prefixIcon;
//   final String? Function(String?)? validator;
//   final int? number;
//   final void Function(int) onIncrease;
//   final void Function(int) onDecrease;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         TextFormField(
//           controller: controller,
//           validator: validator,
//           style: theme.textTheme.titleLarge!.copyWith(
//             fontWeight: FontWeight.normal,
//           ),
//           readOnly: true,
//           enabled: false,
//           decoration: InputDecoration(
//             labelText: label,
//             labelStyle: theme.textTheme.titleLarge!.copyWith(
//               fontWeight: FontWeight.normal,
//             ),
//             errorStyle: theme.textTheme.titleMedium!.copyWith(
//               color: customTheme.error,
//             ),
//             filled: true,
//             fillColor: customTheme.textField,
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide(
//                 color: theme.colorScheme.error,
//               ),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide(
//                 color: theme.colorScheme.primary,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide(
//                 color: theme.colorScheme.primary,
//               ),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide(
//                 color: theme.colorScheme.primary,
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: AlignmentDirectional.centerEnd,
//           child: Padding(
//             padding: EdgeInsets.only(
//               right: Components.isEnglish() ? 8.0 : 0.0,
//               left: !Components.isEnglish() ? 8.0 : 0.0,
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     if (number == null || number == 1) return;
//                     onDecrease(number! - 1);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: theme.colorScheme.background,
//                     ),
//                     child: Icon(
//                       Icons.remove_circle_outline_outlined,
//                       size: 22.0,
//                       color: theme.colorScheme.secondary,
//                       // size: 32.0,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Text(
//                   number == null ? 'number' : '$number',
//                   style: theme.textTheme.titleLarge!.copyWith(
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 GestureDetector(
//                   onTap: () {
//                     onIncrease(number == null ? 1 : number! + 1);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: theme.colorScheme.background,
//                     ),
//                     child: Icon(
//                       Icons.add_circle_outline_outlined,
//                       size: 22.0,
//                       color: theme.colorScheme.secondary,
//                       // size: 32.0,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
