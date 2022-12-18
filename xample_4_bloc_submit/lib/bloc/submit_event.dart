part of 'submit_bloc.dart';

abstract class SubmitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InputEvent extends SubmitEvent {
  InputEvent(this.inputText);
  final String inputText;

  get() => inputText;

  @override
  List<Object> get props => [inputText];
}

class ResetEvent extends SubmitEvent {}
