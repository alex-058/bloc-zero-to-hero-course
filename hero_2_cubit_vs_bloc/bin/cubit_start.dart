import 'dart:async';
import 'package:cubit_vs_bloc/counter_cubit.dart';

Future<void> main(List<String> arguments) async {
  print('Cubit Program is starting');

  final counterCubit = CounterCubit();

  print('Inital state of cubit: ${counterCubit.state}');

  final listener = counterCubit.stream.listen(print);

  counterCubit.increment();
  counterCubit.increment();
  counterCubit.increment();
  counterCubit.decrement();

  await Future.delayed(
      Duration.zero); // needed to not cancel the stream subscription right here

  await listener.cancel(); // cancel listener

  await counterCubit.close(); // close cubit
}
