import 'package:flutter/material.dart';
import 'package:lipid/logic/cubits/Connexion/connexion/connexionstate_cubit.dart';
import 'package:lipid/presentation/screens/connexion/choiceur.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showSheet(BuildContext context, bool loader) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: kGreyThree,
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) => Stack(
              alignment:
                  loader ? Alignment.bottomCenter : Alignment.bottomCenter,
              children: [
                FractionallySizedBox(
                    heightFactor: 0.9,
                    child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: BlocProvider<ConnexionstateCubit>(
                                create: (context) => ConnexionstateCubit(),
                                child: const Choiceur(),
                              ),
                            ))))
              ]));
}
