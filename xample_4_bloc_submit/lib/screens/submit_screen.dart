import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xample_4_bloc_submit/bloc/submit_bloc.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  TextEditingController submitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Submit Screen')),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: submitController,
                  onSubmitted: (value) {
                    // Trigger event
                    BlocProvider.of<SubmitBloc>(context)
                        .add(InputEvent(submitController.text));
                    // print('State: ${BlocProvider.of(context).state}');
                  },
                ),
              ),
              BlocBuilder<SubmitBloc, SubmitState>(
                builder: (context, state) {
                  if (state is TextSubmittedState) {
                    print('Widget is being rebuild');
                    return Text(
                      state.stateValue,
                      style: const TextStyle(fontSize: 25),
                    );
                  } else {
                    return const Text('Nothing submitted yet');
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SubmitBloc>(context).add(ResetEvent());
                  },
                  child: const Text('Reset state'))
            ],
          ),
        ),
      ),
    );
  }
}
