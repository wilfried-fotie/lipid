import 'package:flutter/material.dart';
import 'package:lipid/presentation/pages/setup.dart';
import 'package:lipid/presentation/pages/setup_account.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/services/custom_dropdown/dropdown_plus.dart';

import '../widgets/custom_button.dart';

class ChoosePlan extends StatefulWidget {
  final Map<String, dynamic> startInfo;

  const ChoosePlan({Key? key, required this.startInfo}) : super(key: key);

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  String dropdownvalue = 'Little to no exercise';
  final _formKey = GlobalKey<FormState>();
  bool load = false;
  String gender = 'Male';
  changeData(String value) {
    setState(() {
      dropdownvalue = value;
    });
  }

  changeDataGender(String value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setup account"),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                child: Center(
                  child: Text(
                    "Personal Informations",
                    style: kLinkMedium.copyWith(color: kPrimaryColorTwo),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextDropdownFormField(
                onChanged: changeData,
                options: const [
                  "Little to no exercise",
                  "Light exercise (1-3 days per week)",
                  "Moderate exercise (3-5 days days per week)",
                  "Heavy exercise (6-7 days per week)",
                  "Very heavy exercise (twice per day, extra heavy workouts)"
                ],
                initialValue: "Little to no exercise",
                decoration: input.copyWith(
                    labelText: "select your frequency of physical activity",
                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                        color: kPrimaryColorThree)),
              ),
              const SizedBox(
                height: 28,
              ),
              TextDropdownFormField(
                options: const [
                  "Male",
                  "Female",
                ],
                onChanged: changeDataGender,
                initialValue: "Male",
                dropdownHeight: 120,
                decoration: input.copyWith(
                    labelText: "Gender",
                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                        color: kPrimaryColorThree)),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  text: 'Calculate points',
                  isLoading: load,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        load = true;
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  Setup2(startInfo: widget.startInfo)),
                          (route) => false);

                      if (mounted) {
                        setState(() {
                          load = false;
                        });
                      }
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
