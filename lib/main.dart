import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lipid/presentation/pages/setup.dart';
import 'package:lipid/presentation/pages/setup_account.dart';
import 'package:lipid/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipid/services/shared_prefs/onboarding.dart';
import 'package:lipid/services/shared_prefs/user_pref.dart';
import 'logic/cubits/Connexion/internet_checker/internetchecker_cubit.dart';
import 'presentation/pages/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await OnBoardingPreferences.init();
  await UserPreferences.init();
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
          title: 'LIPID',
          theme: themeLight,
          debugShowCheckedModeBanner: false,
          home: const Checkeur(),
        ));
  }
}

class Checkeur extends StatefulWidget {
  const Checkeur({Key? key}) : super(key: key);

  @override
  State<Checkeur> createState() => _CheckeurState();
}

class _CheckeurState extends State<Checkeur> {
  bool _connected = false;

  @override
  void initState() {
    _connected = OnBoardingPreferences.status();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _connected ? const Setup() : const MyHomePage(title: 'LIPID');
    // return _connected ? const Setup() : const SetupAccount();
  }
}
