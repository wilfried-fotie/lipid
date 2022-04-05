import 'package:flutter/material.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class Forgotten extends StatefulWidget {
  const Forgotten({Key? key}) : super(key: key);

  @override
  State<Forgotten> createState() => _ForgottenState();
}

class _ForgottenState extends State<Forgotten> {
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 18, top: 52),
          child: Text('Password Forgotten',
              style: kLinkMedium.copyWith(color: kGreyOne))),
      Text('Send your Email to renew your password.',
          style: kLinkSmall.copyWith(color: Colors.black)),
      CustomInput(text: "Email Address", value: email),
      CustomButton(
          text: 'Send',
          onPressed: () {
            context.read<ConnexionstateCubit>().setNewpassScreen();
          }),
    ]);
  }
}
