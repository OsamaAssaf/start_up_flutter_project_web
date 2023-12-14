// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../main.dart';
// import '../../components.dart';
//
// class BorderTextField extends StatelessWidget {
//   const BorderTextField({
//     super.key,
//     this.controller,
//     this.obscureText = false,
//     this.label,
//     this.hint,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.validator,
//     this.onTap,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.autofillHints,
//     this.textInputType,
//     this.textInputAction,
//     this.focusNode,
//     this.minLines,
//     this.maxLines = 1,
//     this.maxLength,
//     this.inputFormatters,
//     this.enabled = true,
//     this.isPhone = false,
//   });
//
//   final TextEditingController? controller;
//   final bool obscureText;
//   final String? label;
//   final String? hint;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? Function(String?)? validator;
//   final void Function()? onTap;
//   final void Function(String?)? onChanged;
//   final void Function(String?)? onFieldSubmitted;
//   final List<String>? autofillHints;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final int? minLines;
//   final int? maxLines;
//   final int? maxLength;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool? enabled;
//   final bool isPhone;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       focusNode: focusNode,
//       obscureText: obscureText,
//       autofillHints: autofillHints,
//       validator: validator,
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       maxLength: maxLength,
//       enabled: enabled,
//       textDirection: isPhone ? TextDirection.ltr : null,
//       textAlign: Components.isEnglish()
//           ? TextAlign.start
//           : isPhone
//               ? TextAlign.end
//               : TextAlign.start,
//       style: theme.textTheme.titleLarge!.copyWith(
//         fontWeight: FontWeight.normal,
//       ),
//       keyboardType: textInputType,
//       textInputAction: textInputAction,
//       minLines: minLines,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: customTheme.textField,
//         focusColor: customTheme.textField,
//         hoverColor: customTheme.textField,
//         labelText: label,
//         labelStyle: theme.textTheme.titleLarge!.copyWith(
//           fontWeight: FontWeight.normal,
//         ),
//         errorStyle: theme.textTheme.titleMedium!.copyWith(
//           color: customTheme.error,
//         ),
//         hintText: hint,
//         counterStyle: theme.textTheme.titleMedium!.copyWith(
//           color: customTheme.black,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(
//             color: theme.colorScheme.primary,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(
//             color: theme.colorScheme.primary,
//           ),
//         ),
//         suffixIcon: suffixIcon != null
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   right: Components.isEnglish() ? 8.0 : 0.0,
//                   left: !Components.isEnglish() ? 8.0 : 0.0,
//                 ),
//                 child: UnconstrainedBox(
//                   child: suffixIcon,
//                 ),
//               )
//             : null,
//         prefixIcon: prefixIcon != null
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   right: Components.isEnglish() ? 8.0 : 0.0,
//                   left: !Components.isEnglish() ? 8.0 : 0.0,
//                 ),
//                 child: UnconstrainedBox(
//                   child: prefixIcon,
//                 ),
//               )
//             : null,
//       ),
//       onTap: onTap,
//       onTapOutside: (_) {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       inputFormatters: inputFormatters,
//     );
//   }
// }
