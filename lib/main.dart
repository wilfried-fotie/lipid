import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lipid/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubits/Connexion/internet_checker/internetchecker_cubit.dart';
import 'presentation/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final InternetConnectionChecker it = InternetConnectionChecker();

    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetcheckerCubit>(
            create: (context) => InternetcheckerCubit(internetChecker: it),
          ),
        ],
        child: MaterialApp(
          title: 'LIDIP',
          theme: themeLight,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'LIDIP'),
        ));
  }
}
