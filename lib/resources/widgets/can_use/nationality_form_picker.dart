import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:start_up_workspace/main.dart';
import 'package:start_up_workspace/resources/assets_manager.dart';
import 'package:start_up_workspace/resources/components.dart';

class NationalityFormPicker extends StatelessWidget {
  const NationalityFormPicker({
    super.key,
    this.value,
    this.validator,
    this.onSelect,
    this.label,
  });

  final String? value;
  final String? Function(String?)? validator;
  final void Function(String? countryCode, String? countryName)? onSelect;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showCountryPicker(
          context: context,
          exclude: [
            'IL',
          ],
          favorite: [
            'JO',
            'SA',
          ],
          onSelect: (Country country) {
            if (onSelect == null) return;
            onSelect!(country.countryCode, country.nameLocalized);
          },
        );
      },
      child: TextFormField(
        controller: TextEditingController(
          text: value,
        ),
        validator: validator,
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
          errorStyle: theme.textTheme.titleMedium!.copyWith(
            color: customTheme.error,
          ),
          filled: true,
          fillColor: customTheme.textField,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: theme.colorScheme.error,
            ),
          ),
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              right: Components.isEnglish() ? 8.0 : 0.0,
              left: !Components.isEnglish() ? 8.0 : 0.0,
            ),
            child: UnconstrainedBox(
              child: SvgPicture.asset(
                IconsManager.arrowDownSvg,
                fit: BoxFit.fill,
                width: 14.0,
                height: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
