import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class Refund extends StatefulWidget {
  const Refund({Key? key}) : super(key: key);

  @override
  State<Refund> createState() => _RefundState();
}

class _RefundState extends State<Refund> {
  final TextEditingController name =
      TextEditingController(text: "Maximum prime");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Refund", style: kLinkSmall.copyWith(color: kPrimaryColorOne)),
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
                text: 'Phone number for transfer',
                value: phone,
                validation: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(text: 'Request', onPressed: () async {})
            ],
          ),
        ),
      ),
    );
  }
}
