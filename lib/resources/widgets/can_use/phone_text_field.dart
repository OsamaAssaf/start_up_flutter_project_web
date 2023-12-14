// import 'package:flutter/material.dart';
//
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/services.dart';
//
// import '../../../main.dart';
// import '../main_text_field.dart';
// import '../scale_text.dart';
//
// class PhoneTextField extends StatelessWidget {
//   const PhoneTextField({
//     super.key,
//     required this.countryFlag,
//     this.label,
//     this.hint,
//     this.controller,
//     this.onSelect,
//     this.textInputAction,
//     this.focusNode,
//     this.validator,
//   });
//
//   final String countryFlag;
//   final String? label;
//   final String? hint;
//   final TextEditingController? controller;
//   final void Function(
//       String? countryCode, String? countryName, String? phoneCode, String? flagEmoji)? onSelect;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final String? Function(String?)? validator;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             OutlinedButton(
//               onPressed: () {
//                 showCountryPicker(
//                   context: context,
//                   exclude: [
//                     'IL',
//                   ],
//                   favorite: [
//                     'JO',
//                     'SA',
//                   ],
//                   onSelect: (Country country) {
//                     if (onSelect == null) return;
//                     onSelect!(country.countryCode, country.nameLocalized, country.phoneCode,
//                         country.flagEmoji);
//                   },
//                 );
//               },
//               style: OutlinedButton.styleFrom(
//                 fixedSize: const Size.fromHeight(46.0),
//                 backgroundColor: Colors.transparent,
//                 side: BorderSide(
//                   color: customTheme.lightGrey,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.zero,
//               ),
//               child: ScaleText(
//                 countryFlag,
//                 style: theme.textTheme.titleLarge!.copyWith(
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8.0),
//             Expanded(
//               child: MainTextField(
//                 controller: controller,
//                 label: label ?? localizations.phoneNumber,
//                 focusNode: focusNode,
//                 validator: validator,
//                 textInputAction: textInputAction,
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
