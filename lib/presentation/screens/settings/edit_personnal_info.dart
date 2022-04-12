import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class EditPersonnalInfo extends StatefulWidget {
  const EditPersonnalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonnalInfo> createState() => _EditPersonnalInfoState();
}

class _EditPersonnalInfoState extends State<EditPersonnalInfo> {
  final TextEditingController name =
      TextEditingController(text: "Maximum prime");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Information",
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
                text: 'Full name',
                value: name,
                validation: true,
              ),
              CustomInput(
                text: 'Email Address / Phone number',
                value: phone,
                validation: true,
              ),
              CustomInput(
                text: 'Age',
                value: phone,
                validation: true,
              ),
              CustomInput(
                text: 'Hight (cm)',
                value: phone,
                validation: true,
              ),
              CustomInput(
                text: 'Body weight (kg)',
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
