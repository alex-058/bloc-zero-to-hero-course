import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hero_6_bloc_access_navigation/constants/enums.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity; // connection state from connectivity package

  InternetCubit(this.connectivity) : super(InternetLoading());

  void emitInternetConnected(ConnectionType ctype) =>
      emit(InternetConnected(ctype));

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
