import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexion_screen.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/pages/setup.dart';

import 'package:lipid/presentation/screens/connexion/login.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/services/shared_prefs/onboarding.dart';

import 'register.dart';
import 'forgotten.dart';
import 'new_password.dart';

class Choiceur extends StatelessWidget {
  const Choiceur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    return Navigator.pop(context, false);
                  }),
              TextButton(
                  onPressed: () {
                    if (BlocProvider.of<ConnexionstateCubit>(context,
                                listen: false)
                            .state
                            .activeScreen ==
                        ConnexionScreen.login) {
                      context
                          .read<ConnexionstateCubit>()
                          .setRegistrationScreen();
                    } else {
                      context.read<ConnexionstateCubit>().setLoginScreen();
                    }
                  },
                  child: Text(
                      context.watch<ConnexionstateCubit>().state.activeScreen ==
                              ConnexionScreen.login
                          ? 'Create an account'
                          : 'login',
                      style: ktextxSmall.copyWith(color: kPrimaryColorOne)))
            ],
          ),
          BlocBuilder<ConnexionstateCubit, ConnexionstateInitial>(
            builder: (context, state) {
              if (state.activeScreen == ConnexionScreen.login) {
                return const LoginInputs();
              } else if (state.activeScreen == ConnexionScreen.registration) {
                return const ConnectInputs();
              } else if (state.activeScreen == ConnexionScreen.newpass) {
                return const NewPass();
              } else {
                return const Forgotten();
              }
            },
          ),
        ],
      ),
    );
  }
}
