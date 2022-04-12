import 'package:flutter/material.dart';
import 'package:lipid/presentation/pages/choose_plan.dart';
import 'package:lipid/presentation/pages/setup.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';
import 'package:lipid/services/custom_dropdown/dropdown_plus.dart';

import '../../data/models/user.dart';
import '../../data/providers/accounts_api.dart';

class SetupAccount extends StatelessWidget {
  final User user;
  const SetupAccount({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        title: const Text("Setup account"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Setup1(user: user),
      ),
    );
  }
}

class Setup1 extends StatefulWidget {
  final User user;
  const Setup1({Key? key, required this.user}) : super(key: key);
  @override
  State<Setup1> createState() => _Setup1State();
}

class _Setup1State extends State<Setup1> {
  late final TextEditingController name;

  final TextEditingController height = TextEditingController();

  final TextEditingController age = TextEditingController();

  final TextEditingController bodyWeight = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool load = false;

  @override
  void initState() {
    name = TextEditingController(text: widget.user.name);
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    height.dispose();
    age.dispose();
    bodyWeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            CustomInput(
              text: 'Full name',
              value: name,
              validation: true,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
                text: 'Age',
                value: age,
                number: true,
                validation: true,
                validator: (input) {
                  if (input != "" && input!.isNotEmpty
                      ? int.parse(input.trim()) < 100
                      : false) {
                    return null;
                  } else {
                    return "age can least 150 an be a number";
                  }
                }),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
                text: 'Height (cm)',
                value: height,
                validation: true,
                number: true,
                validator: (input) {
                  if (input != "" && input!.isNotEmpty
                      ? int.parse(input.trim()) < 300
                      : false) {
                    return null;
                  } else {
                    return "height can least 300 cm an be a number";
                  }
                }),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
                text: 'Body weight',
                value: bodyWeight,
                validation: true,
                number: true,
                validator: (input) {
                  if (input != "" && input!.isNotEmpty
                      ? int.parse(input.trim()) < 300
                      : false) {
                    return null;
                  } else {
                    return "Body weight  can least 300 kg an be a number";
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
                text: 'Next',
                isLoading: load,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      load = true;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoosePlan(startInfo: {
                                    "name": name.text.trim(),
                                    "height": height.text.trim(),
                                    "bodyWeight": bodyWeight.text.trim(),
                                    "age": age.text.trim()
                                  })));
                    });

                    setState(() {
                      load = !load;
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}

class Setup2 extends StatefulWidget {
  final Map<String, dynamic> startInfo;
  const Setup2({
    Key? key,
    required this.startInfo,
  }) : super(key: key);

  @override
  State<Setup2> createState() => _Setup2State();
}

class _Setup2State extends State<Setup2> {
  String dropdownvalue = 'Little to no exercise';
  String gender = 'Male';
  ChoosePlanAction _paye = ChoosePlanAction.mtn;
  // List of items in our dropdown menu
  AccountsApi _api = AccountsApi();
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
      backgroundColor: kBg,
      appBar: AppBar(
        title: const Text("Setup account"),
        centerTitle: true,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                  child: Center(
                    child: Text(
                      "Personal Informations  ",
                      style: kLinkMedium.copyWith(color: kPrimaryColorTwo),
                    ),
                  ),
                ),
                TextDropdownFormField(
                  options: const [
                    "12 Month",
                    "11 Month",
                    "10 Month",
                    "9 Month",
                    "8 Month",
                    "7 Month",
                    "6 Month",
                    "5 Month",
                    "4 Month",
                    "3 Month",
                    "2 Month",
                    "1 Month",
                  ],
                  onChanged: changeData,
                  initialValue: "12 Month",
                  decoration: input.copyWith(
                      labelText: "Gender",
                      suffixIcon: Icon(Icons.keyboard_arrow_down,
                          color: kPrimaryColorThree)),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _paye = ChoosePlanAction.mtn;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kGreyOne, width: .5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Radio<ChoosePlanAction>(
                          value: ChoosePlanAction.mtn,
                          groupValue: _paye,
                          onChanged: (ChoosePlanAction? value) {
                            setState(() {
                              _paye = value!;
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("MTN MOMO "),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "36000FCFA/Year",
                              style: kLinkXSmall.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        _paye == ChoosePlanAction.mtn
                            ? Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff22B02E),
                                ),
                                child: const Icon(Icons.check,
                                    size: 15, color: Colors.white),
                              )
                            : Container(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _paye = ChoosePlanAction.orange;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kGreyOne, width: .5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Radio<ChoosePlanAction>(
                          value: ChoosePlanAction.orange,
                          groupValue: _paye,
                          onChanged: (ChoosePlanAction? value) {
                            setState(() {
                              _paye = value!;
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Orange money (OM)"),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "36000FCFA/Year",
                              style: kLinkXSmall.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        _paye == ChoosePlanAction.orange
                            ? Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff22B02E),
                                ),
                                child: const Icon(Icons.check,
                                    size: 15, color: Colors.white),
                              )
                            : Container(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                    text: 'Pay',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Succes()),
                      );
                    }),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          )),
    );
  }
}

class Succes extends StatelessWidget {
  const Succes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/img/succes.png'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Your subscription for ",
                  style: kLinkXSmall.copyWith(color: kGreyOne)),
              TextSpan(
                  text: "12 month",
                  style: kLinkXSmall.copyWith(color: kPrimaryColorOne)),
              TextSpan(
                  text: " Successfull",
                  style: kLinkXSmall.copyWith(color: kGreyOne)),
            ])),
          ),
          const Spacer(),
          CustomButton(
              text: 'Start now',
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Setup()),
                    (route) => false);
              }),
          const Spacer(),
        ],
      ),
    ));
  }
}

enum ChoosePlanAction { mtn, orange }
