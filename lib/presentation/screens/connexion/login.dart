import 'package:flutter/material.dart';
import 'package:lipid/data/providers/users_api.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexion_screen.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/pages/setup.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';
import 'package:lipid/services/google_sign_in/google_sign_in.dart';
import 'package:lipid/services/shared_prefs/onboarding.dart';
import 'package:lipid/services/shared_prefs/user_pref.dart';

import '../../pages/setup_account.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool load = false;
  Map<String, dynamic> data = {};

  @override
  void dispose() {
    mailOrPhone.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = context
        .select<ConnexionstateCubit, Status>((screen) => screen.state.status);
    return Form(
      key: _formKey,
      child: Column(children: [
        status == Status.initial
            ? const SizedBox()
            : status == Status.success
                ? const SizedBox()
                : Text("The information is incorrect",
                    style: kLinkXSmall.copyWith(color: kSecondaryRed)),
        Container(
            margin: const EdgeInsets.only(bottom: 18, top: 32),
            child:
                Text('Log In', style: kLinkMedium.copyWith(color: kGreyOne))),
        CustomInput(
          text: "Email Address / Phone number",
          value: mailOrPhone,
          validation: true,
          validator: (input) {
            String p =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            RegExp regExp = RegExp(p);
            if (regExp.hasMatch(input!.trim()) ||
                int.tryParse(input.trim()) is int && input.trim().length == 9) {
              return null;
            } else {
              return "enter a valid email or phone number";
            }
          },
        ),
        CustomInput(
            text: 'Password',
            value: pass,
            isPassword: true,
            validation: true,
            validator: (input) {
              if (input!.trim().length >= 8) {
                return null;
              } else {
                return "password must be at least 8 characters";
              }
            }),
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
            isLoading: load,
            onPressed: () async {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState!.validate()) {
                setState(() {
                  load = true;
                });
                await _api.login(map: {
                  "identifiant": mailOrPhone.text.trim(),
                  "password": pass.text.trim()
                }).then((value) {
                  context.read<ConnexionstateCubit>().changeScreenStatus(
                      ConnexionScreen.login, Status.success);

                  UserPreferences.toggleId(value["data"]["user"]["id"] as int);
                  UserPreferences.toggleToken(value["data"]["token"]);

                  setState(() {
                    data = value;
                  });

                  OnBoardingPreferences.toggleStatus();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Setup()),
                      (route) => false);
                }).catchError((value) {
                  context
                      .read<ConnexionstateCubit>()
                      .changeScreenStatus(ConnexionScreen.login, Status.error);
                });

                if (mounted) {
                  setState(() {
                    load = false;
                  });
                }
              }
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
              onPressed: () async {
                var user = await GoogleSignInApi.login();
                if (user != null) {
                  OnBoardingPreferences.toggleStatus();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Setup()),
                      (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Une erreur c'est survenu")));
                  print("error");
                }
                // await _api.read();
              }),
        ),
        const SizedBox(height: 50),
      ]),
    );
  }
}
