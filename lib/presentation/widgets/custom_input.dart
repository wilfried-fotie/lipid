import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

class CustomInput extends StatefulWidget {
  final String text;
  final bool validation;
  final bool isPassword;
  final bool number;
  final TextEditingController? value;
  final String? Function(String?)? validator;
  const CustomInput({
    Key? key,
    required this.text,
    this.validation = false,
    this.validator,
    required this.value,
    this.isPassword = false,
    this.number = false,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      width: MediaQuery.of(context).size.width - (35 * 2),
      child: TextFormField(
          controller: widget.value,
          keyboardType: widget.number ? TextInputType.number : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isPassword && !visible,
          validator: widget.validation
              ? widget.validator ??
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
            labelText: widget.text,
            suffixIcon: widget.isPassword && !visible
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: kPrimaryColorTwo,
                    ),
                  )
                : visible
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: Icon(
                          Icons.visibility_off,
                          color: kPrimaryColorTwo,
                        ),
                      )
                    : null,
          )),
    );
  }
}
