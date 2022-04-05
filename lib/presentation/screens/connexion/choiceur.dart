import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexion_screen.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/logic/cubits/Connexion/internet_checker/internet_status.dart';
import 'package:lipid/logic/cubits/Connexion/internet_checker/internetchecker_cubit.dart';

import 'package:lipid/presentation/screens/connexion/login.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

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
          BlocBuilder<InternetcheckerCubit, InternetcheckerInitial>(
            builder: (context, state) {
              if (state.status == InternetStatus.disconnected) {
                return Text(
                  "Please connect to the internet",
                  style: kLinkSmall.copyWith(color: kSecondaryRed),
                );
              } else if (state.status == InternetStatus.loading) {
                return CircularProgressIndicator(
                  color: kPrimaryColorOne,
                );
              } else {
                return Container();
              }
            },
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
          )
        ],
      ),
    );
  }
}
