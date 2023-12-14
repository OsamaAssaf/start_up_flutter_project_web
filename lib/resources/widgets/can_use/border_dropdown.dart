import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';
import '../../assets_manager.dart';
import '../../components.dart';

class BorderDropdown extends StatelessWidget {
  const BorderDropdown({
    super.key,
    this.value,
    required this.items,
    this.hint,
    this.validator,
    this.onChanged,
    this.isExpanded = false,
  });
  final Object? value;
  final List<DropdownMenuItem<Object?>> items;
  final String? hint;
  final String? Function(Object?)? validator;
  final void Function(Object?)? onChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Object?>(
      value: value,
      items: items,
      isExpanded: isExpanded,
      validator: validator,
      onChanged: onChanged,
      icon: Padding(
        padding: EdgeInsets.only(
          right: Components.isEnglish() ? 8.0 : 0.0,
          left: !Components.isEnglish() ? 8.0 : 0.0,
        ),
        child: UnconstrainedBox(
          child: SvgPicture.asset(
            IconsManager.arrowDownSvg,
            fit: BoxFit.fill,
            width: 16.0,
            height: 16.0,
          ),
        ),
      ),
      style: theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.normal,
      ),
      hint: Text(
        hint.toString(),
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: customTheme.textField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      dropdownColor: theme.cardColor.withOpacity(0.9),
    );
  }
}
