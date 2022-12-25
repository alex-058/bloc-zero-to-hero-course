import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/home_screen.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/second_screen.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/third_screen.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                title: 'Flutter Demo Home Page',
                color: Colors.blueAccent,
              ),
            ),
        '/second_screen': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: 'Second Screen',
                color: Colors.redAccent,
              ),
            ),
        '/third_screen': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                  title: 'Third screen', color: Colors.greenAccent),
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
