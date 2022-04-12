import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  final TextEditingController name =
      TextEditingController(text: "Maximum prime");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password",
            style: kLinkSmall.copyWith(color: kPrimaryColorOne)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 28,
              ),
              CustomInput(
                text: 'New password',
                value: name,
                validation: true,
              ),
              CustomInput(
                text: 'Confirm password',
                value: phone,
                validation: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(text: 'Save', onPressed: () async {})
            ],
          ),
        ),
      ),
    );
  }
}
