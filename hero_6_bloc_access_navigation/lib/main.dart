import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/home_screen.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/second_screen.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(),
              child: const HomeScreen(
                title: 'Flutter Demo Home Page',
                color: Colors.blueAccent,
              ),
            ),
        'second_screen': (context) => const SecondScreen(
              title: 'Second Screen',
              color: Colors.redAccent,
            ),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Providing single instance of counter cubit at root of widget tree (dependency injection)
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
