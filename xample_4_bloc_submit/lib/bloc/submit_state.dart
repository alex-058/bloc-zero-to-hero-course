part of 'submit_bloc.dart';

abstract class SubmitState extends Equatable {
  const SubmitState();

  @override
  List<Object> get props => [];
}

class NotSubmittedState extends SubmitState {}

class TextSubmittedState extends SubmitState {
  final String stateValue;

  const TextSubmittedState(this.stateValue);

  @override
  List<Object> get props => [stateValue];
}
