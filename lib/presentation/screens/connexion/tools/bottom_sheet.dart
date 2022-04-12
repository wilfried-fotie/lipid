import 'package:flutter/material.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/logic/cubits/Connexion/internet_checker/internet_status.dart';
import 'package:lipid/logic/cubits/Connexion/internet_checker/internetchecker_cubit.dart';
import 'package:lipid/presentation/screens/connexion/choiceur.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pageur extends StatelessWidget {
  const Pageur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: kGreyThree,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<InternetcheckerCubit, InternetcheckerInitial>(
                builder: (context, state) {
                  if (state.status == InternetStatus.disconnected) {
                    return Container(
                      color: kSecondaryRed,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Please connect to the internet",
                        style: kLinkSmall.copyWith(color: Colors.white),
                      ),
                    );
                  } else if (state.status == InternetStatus.loading) {
                    return Container(
                      alignment: Alignment.center,
                      child: LinearProgressIndicator(
                        color: kPrimaryColorOne,
                        backgroundColor: kGreyOne,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: BlocProvider<ConnexionstateCubit>(
                      create: (context) => ConnexionstateCubit(),
                      child: const Choiceur(),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
