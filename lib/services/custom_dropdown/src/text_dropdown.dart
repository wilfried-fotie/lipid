import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/services/custom_dropdown/src/dropdown.dart';

/// Simple dorpdown whith plain text as a dropdown items.
class TextDropdownFormField extends StatelessWidget {
  final List<String> options;
  final InputDecoration? decoration;
  final DropdownEditingController<String>? controller;
  final void Function(String vqlue) onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool Function(String item, String str)? filterFn;
  final Future<List<String>> Function(String str)? findFn;
  final double? dropdownHeight;
  final String initialValue;

  const TextDropdownFormField({
    Key? key,
    required this.options,
    this.decoration,
    this.onSaved,
    this.controller,
    required this.onChanged,
    this.validator,
    required this.initialValue,
    this.findFn,
    this.filterFn,
    this.dropdownHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownFormField<String>(
      decoration: decoration,
      onSaved: onSaved,
      controller: controller,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      dropdownHeight: dropdownHeight,
      displayItemFn: (dynamic str) => Text(
        str ?? '',
        style: const TextStyle(fontSize: 16),
      ),
      findFn: findFn ?? (dynamic str) async => options,
      filterFn: filterFn ??
          (dynamic item, str) =>
              item.toLowerCase().indexOf(str.toLowerCase()) >= 0,
      dropdownItemFn:
          (dynamic item, position, focused, selected, onTap, selectedItem) {
        return ListTile(
          title: Text(
            item,
            style: kLinkSmall.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: selected ? kPrimaryColorOne : kPrimaryColorThree),
          ),
          tileColor:
              focused ? const Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
          onTap: onTap,
        );
      },
    );
  }
}
