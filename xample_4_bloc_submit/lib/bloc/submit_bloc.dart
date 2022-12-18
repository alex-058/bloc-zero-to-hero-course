import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'submit_event.dart';
part 'submit_state.dart';

class SubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  SubmitBloc() : super(NotSubmittedState()) {
    on<InputEvent>((event, emit) {
      print('Submit event got triggered');
      emit(TextSubmittedState(event.inputText));
    });
    on<ResetEvent>(
      (event, emit) {
        print('Reset event got triggered');
        emit(NotSubmittedState());
      },
    );
  }
}
