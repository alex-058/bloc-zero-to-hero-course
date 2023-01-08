part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

// acts as initial state
class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType; // wifi or mobile?

  InternetConnected(this.connectionType);
}

class InternetDisconnected extends InternetState {}
