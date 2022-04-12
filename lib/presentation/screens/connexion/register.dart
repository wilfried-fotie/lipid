import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lipid/data/models/user.dart';
import 'package:lipid/data/providers/users_api.dart';
import 'package:lipid/presentation/pages/setup_account.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';
import 'package:lipid/services/google_sign_in/google_sign_in.dart';

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
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cfpassword = TextEditingController();
  bool load = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    cfpassword.dispose();
    password.dispose();
    phoneNumber.dispose();
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
          validator: (input) {
            String p =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            RegExp regExp = RegExp(p);
            if (regExp.hasMatch(input!.trim())) {
              return null;
            } else {
              return "enter a valid email";
            }
          },
        ),
        CustomInput(
          text: 'Phone Number',
          value: phoneNumber,
          number: true,
          validation: true,
          validator: (value) {
            if (value!.trim().length == 9) {
              return null;
            } else {
              return "Phone Number must be at least 9 characters";
            }
          },
        ),
        CustomInput(
          text: 'Password',
          value: password,
          isPassword: true,
          validation: true,
          validator: (value) {
            if (value!.trim().length >= 8) {
              return null;
            } else {
              return "password must be at least 8 characters";
            }
          },
        ),
        CustomInput(
          text: 'Confirm Password',
          value: cfpassword,
          validation: true,
          isPassword: true,
          validator: (value) {
            if (value!.trim() == password.text.trim()) {
              return null;
            } else {
              return "it is different from the password";
            }
          },
        ),
        CustomButton(
            text: 'Next',
            isLoading: load,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  load = true;
                });
                User _user = User(
                    name: name.text.trim(),
                    password: password.text.trim(),
                    passwordConfirmation: cfpassword.text.trim(),
                    isActive: false,
                    phone: phoneNumber.text.trim(),
                    email: email.text.trim());
                await _api.create(user: _user).then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SetupAccount(user: _user)),
                      (route) => false);
                }).catchError((value) {});
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
        CustomButton(
            icon: "assets/img/Vector.png",
            back: false,
            text: 'Continue with Google',
            onPressed: () async {
              var user = await GoogleSignInApi.login();
              if (user != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SetupAccount(user: user)),
                    (route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Une erreur est survenu")));
              }

              if (mounted) {
                setState(() {
                  load = false;
                });
              }

              print(user);
            }),
      ]),
    );
  }
}
