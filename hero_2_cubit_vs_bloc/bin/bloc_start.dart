import 'package:cubit_vs_bloc/bloc/counter_bloc.dart';

Future<void> main(List<String> arguments) async {
  print('BLoC Program is starting');

  // Initialize Bloc which holds a initital state
  final bloc = CounterBloc();

  print('Inital bloc state: ${bloc.state}');

  // Listen to actions in STATES stream
  final blocStreamListener = bloc.stream.listen(print);

  // Trigger events in EVENTS stream
  bloc.add(IncrementEvent());
  bloc.add(DecrementEvent());
  bloc.add(IncrementEvent());
  bloc.add(IncrementEvent());
  bloc.add(IncrementEvent());
  bloc.add(DecrementEvent());

  // Prevent immediate close of stream subscription
  await Future.delayed(Duration.zero);

  blocStreamListener.cancel();
  bloc.close();
}
