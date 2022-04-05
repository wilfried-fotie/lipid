import 'package:flutter/material.dart';
import 'package:lipid/data/providers/users_api.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';
import 'package:lipid/services/google_sign_in/google_sign_in.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  final TextEditingController mailOrPhone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final UsersApi _api = UsersApi();

  @override
  void dispose() {
    mailOrPhone.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 18, top: 32),
          child: Text('Log In', style: kLinkMedium.copyWith(color: kGreyOne))),
      CustomInput(text: "Email Address / Phone number", value: mailOrPhone),
      CustomInput(text: 'Password', value: pass),
      Align(
        alignment: Alignment.topLeft,
        child: TextButton(
            onPressed: () {
              context.read<ConnexionstateCubit>().setForgottenScreen();
            },
            child: const Text('Forgotten Password ?')),
      ),
      CustomButton(
          text: 'Login',
          onPressed: () async {
            await _api
                .read()
                .then((value) => print("reussite"))
                .catchError((value) => print("echec"));
          }),
      Row(children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: kGreyTwo,
                height: 36,
              )),
        ),
        Text(' Or Log In with ',
            style: kLinkSmall.copyWith(
                fontWeight: FontWeight.w500, color: kGreyTwo)),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: kGreyTwo,
                height: 36,
              )),
        ),
      ]),
      Material(
        child: CustomButton(
            icon: "assets/img/Vector.png",
            back: false,
            text: 'Continue with Google',
            onPressed: () {
              GoogleSignInApi.login();
            }),
      ),
    ]);
  }
}
