part of 'connexionstate_cubit.dart';

class ConnexionstateInitial {
  final ConnexionScreen activeScreen;
  final Status status;
  const ConnexionstateInitial({
    required this.activeScreen,
    this.status = Status.initial,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConnexionstateInitial &&
        other.activeScreen == activeScreen &&
        other.status == status;
  }

  @override
  int get hashCode => activeScreen.hashCode ^ status.hashCode;

  ConnexionstateInitial copyWith({
    ConnexionScreen? activeScreen,
    Status? status,
  }) {
    return ConnexionstateInitial(
      activeScreen: activeScreen ?? this.activeScreen,
      status: status ?? this.status,
    );
  }
}
