import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

class CustomInput extends StatelessWidget {
  final String text;
  final bool validation;
  final TextEditingController? value;
  final String? Function(String?)? validator;
  const CustomInput(
      {Key? key,
      required this.text,
      this.validation = false,
      this.validator,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      width: MediaQuery.of(context).size.width - (35 * 2),
      child: TextFormField(
        controller: value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validation
            ? validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }
            : null,
        style: kLinkSmall.copyWith(
            fontWeight: FontWeight.w500, color: Colors.black),
        decoration: input.copyWith(
          labelText: text,
        ),
      ),
    );
  }
}


// validator: (String? value) {
//     return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//   },