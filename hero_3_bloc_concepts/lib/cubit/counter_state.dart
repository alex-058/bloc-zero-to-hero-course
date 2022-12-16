part of 'counter_cubit.dart';

class CounterState {
  // int value is the state in this example
  int counterValue;
  bool wasIncremented;

  // required parameter makes it named parameter
  CounterState({required this.counterValue, required this.wasIncremented});
}
