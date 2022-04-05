import 'package:bloc/bloc.dart';

import 'connexion_screen.dart';

part 'connexionstate_state.dart';

class ConnexionstateCubit extends Cubit<ConnexionstateInitial> {
  ConnexionstateCubit()
      : super(const ConnexionstateInitial(activeScreen: ConnexionScreen.login));

  void setRegistrationScreen() => emit(
      const ConnexionstateInitial(activeScreen: ConnexionScreen.registration));

  void setLoginScreen() {
    return emit(
        const ConnexionstateInitial(activeScreen: ConnexionScreen.login));
  }

  void setForgottenScreen() => emit(
      const ConnexionstateInitial(activeScreen: ConnexionScreen.forgotten));

  void setNewpassScreen() =>
      emit(const ConnexionstateInitial(activeScreen: ConnexionScreen.newpass));
}
