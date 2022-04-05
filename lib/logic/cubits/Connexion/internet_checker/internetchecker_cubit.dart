import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lipid/logic/cubits/Connexion/internet_checker/internet_status.dart';

part 'internetchecker_state.dart';

class InternetcheckerCubit extends Cubit<InternetcheckerInitial> {
  final InternetConnectionChecker internetChecker;

  late StreamSubscription<InternetConnectionStatus>
      internetCheckerStreamSubscription;

  InternetcheckerCubit({required this.internetChecker})
      : super(const InternetcheckerInitial(status: InternetStatus.loading)) {
    internetCheckerStreamSubscription = internetChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            connect();
            break;
          case InternetConnectionStatus.disconnected:
            disconnect();
            break;
        }
      },
    );
  }

  connect() =>
      emit(const InternetcheckerInitial(status: InternetStatus.connected));

  disconnect() =>
      emit(const InternetcheckerInitial(status: InternetStatus.disconnected));

  loading() =>
      emit(const InternetcheckerInitial(status: InternetStatus.loading));

  @override
  Future<void> close() {
    internetCheckerStreamSubscription.cancel();
    return super.close();
  }
}
