import 'package:flutter/material.dart';
import 'package:start_up_workspace/main.dart';

class DisableBorderTextField extends StatelessWidget {
  const DisableBorderTextField({
    super.key,
    this.controller,
    this.label,
    this.prefixIcon,
    this.validator,
    this.onTap,
    this.border,
    this.enabledBorder,
    this.suffixIcon,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String? label;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
          initialValue: initialValue,
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
          readOnly: true,
          enabled: false,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.normal,
            ),
            filled: true,
            fillColor: customTheme.textField,
            errorStyle: theme.textTheme.titleMedium!.copyWith(
              color: customTheme.error,
            ),
            errorBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                  ),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                  ),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                  ),
                ),
            disabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                  ),
                ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
