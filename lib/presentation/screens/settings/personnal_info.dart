import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';

import 'edit_personnal_info.dart';

class PersonnalInfo extends StatefulWidget {
  const PersonnalInfo({Key? key}) : super(key: key);

  @override
  State<PersonnalInfo> createState() => _PersonnalInfoState();
}

class _PersonnalInfoState extends State<PersonnalInfo> {
  final TextEditingController name =
      TextEditingController(text: "Maximum prime");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information",
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
                height: 50,
              ),
              Text("Name",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              Text("Maxime",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              const SizedBox(
                height: 20,
              ),
              Text("Email",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              Text("maxime@gmail.com",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              const SizedBox(
                height: 20,
              ),
              Text("Gender",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              Text("Male",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              const SizedBox(
                height: 20,
              ),
              Text("Age", style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              Text("28", style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              const SizedBox(
                height: 20,
              ),
              Text("Height",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              Text("178cm",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              const SizedBox(
                height: 20,
              ),
              Text("Weight",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorTwo)),
              Text("100kg",
                  style: kLinkSmall.copyWith(color: kPrimaryColorThree)),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  text: 'Update',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EditPersonnalInfo()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
