import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';
import '../../components.dart';

class UnderlineTextField extends StatelessWidget {
  const UnderlineTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofillHints,
    this.textInputType,
    this.textInputAction,
    this.focusNode,
    this.readOnly = false,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.hint,
    this.helperText,
    this.helperStyle,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final List<String>? autofillHints;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? hint;
  final String? helperText;
  final TextStyle? helperStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        autofillHints: autofillHints,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.normal,
        ),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          labelText: label,
          labelStyle: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
          errorStyle: theme.textTheme.titleMedium!.copyWith(
            color: customTheme.error,
          ),
          hintText: hint,
          fillColor: customTheme.textField,
          focusColor: customTheme.textField,
          hoverColor: customTheme.textField,
          helperText: helperText,
          helperStyle: helperStyle,
          counterStyle: theme.textTheme.titleMedium!.copyWith(
            color: customTheme.black,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: Components.isEnglish() ? 8.0 : 0.0,
                    left: !Components.isEnglish() ? 8.0 : 0.0,
                  ),
                  child: UnconstrainedBox(
                    child: suffixIcon,
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: Components.isEnglish() ? 8.0 : 0.0,
                    left: !Components.isEnglish() ? 8.0 : 0.0,
                  ),
                  child: UnconstrainedBox(
                    child: prefixIcon,
                  ),
                )
              : null,
        ),
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
