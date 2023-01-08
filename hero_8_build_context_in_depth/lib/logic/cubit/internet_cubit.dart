import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hero_6_bloc_access_navigation/constants/enums.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity; // connection state from connectivity package
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit(this.connectivity) : super(InternetLoading()) {
    monitorConnectivity();
  }

  StreamSubscription<ConnectivityResult> monitorConnectivity() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (result == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType ctype) =>
      emit(InternetConnected(ctype));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
