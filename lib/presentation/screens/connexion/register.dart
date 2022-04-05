import 'package:flutter/material.dart';
import 'package:lipid/data/providers/users_api.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';
import 'package:lipid/services/google_sign_in/google_sign_in.dart';
import 'tools/phone_country.dart';

class ConnectInputs extends StatefulWidget {
  const ConnectInputs({
    Key? key,
  }) : super(key: key);

  @override
  State<ConnectInputs> createState() => _ConnectInputsState();
}

class _ConnectInputsState extends State<ConnectInputs> {
  final UsersApi _api = UsersApi();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final String phone = "";
  final TextEditingController password = TextEditingController();
  final TextEditingController cfpassword = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    cfpassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(bottom: 18, top: 12),
            child: Text('Create an account',
                style: kLinkMedium.copyWith(color: kGreyOne))),
        CustomInput(
          text: "Full Name",
          validation: true,
          value: name,
        ),
        CustomInput(
          text: 'Email Address',
          value: email,
          validation: true,
        ),
        PhoneCountry(
          value: phone,
        ),
        CustomInput(
          text: 'Password',
          value: password,
        ),
        CustomInput(text: 'Confirm Password', value: cfpassword),
        CustomButton(
            text: 'Next',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _api
                    .read()
                    .then((value) => print("reussite"))
                    .catchError((value) => print("echec"));
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
        CustomButton(
            icon: "assets/img/Vector.png",
            back: false,
            text: 'Continue with Google',
            onPressed: () {
              GoogleSignInApi.login();
            }),
      ]),
    );
  }
}
