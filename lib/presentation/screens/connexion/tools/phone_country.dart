import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

class PhoneCountry extends StatelessWidget {
  String value;

  PhoneCountry({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonPadding: const EdgeInsets.only(left: 18),
      showDropdownIcon: false,
      decoration: input.copyWith(
        labelText: "Phone Number",
      ),
      initialCountryCode: 'CM',
      onChanged: (phone) {
        value = phone.completeNumber;
      },
    );
  }
}
