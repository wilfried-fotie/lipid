import 'package:flutter/material.dart';
import 'package:lipid/presentation/pages/setup_account.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/services/custom_dropdown/dropdown_plus.dart';

class Resubscribe extends StatefulWidget {
  const Resubscribe({
    Key? key,
  }) : super(key: key);

  @override
  State<Resubscribe> createState() => _ResubscribeState();
}

class _ResubscribeState extends State<Resubscribe> {
  String month = '12 Month';
  ChoosePlanAction _paye = ChoosePlanAction.mtn;
  // List of items in our dropdown menu

  changeData(String value) {
    setState(() {
      month = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 30, left: 20, right: 20),
                  child: Center(
                    child: Text(
                      "Choose number of month and payment method",
                      style: kLinkMedium.copyWith(color: kPrimaryColorTwo),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 38,
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
                CustomButton(text: 'Pay', onPressed: () async {}),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          )),
    );
  }
}
