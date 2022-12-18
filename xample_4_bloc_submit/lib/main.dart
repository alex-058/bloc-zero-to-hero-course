import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xample_4_bloc_submit/bloc/submit_bloc.dart';
import 'package:xample_4_bloc_submit/screens/submit_screen.dart';

void main() {
  runApp(BlocProvider<SubmitBloc>(
    create: (context) => SubmitBloc(),
    child: const SubmitScreen(),
  ));
}
