import 'package:flutter/material.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class NewPass extends StatefulWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final TextEditingController newPass = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    newPass.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 18, top: 52),
          child: Text('New Password',
              style: kLinkMedium.copyWith(color: kGreyOne))),
      CustomInput(text: "New Password", value: newPass),
      CustomInput(text: "Confirm Password", value: pass),
      CustomButton(text: 'Renew', onPressed: () {}),
    ]);
  }
}
