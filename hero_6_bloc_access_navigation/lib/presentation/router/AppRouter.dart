import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_6_bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/home_screen.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/second_screen.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  void dispose() {
    _counterCubit.close();
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                      title: "Home Page", color: Colors.blueAccent),
                ));
      case '/second_screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                      title: "Second Screen", color: Colors.greenAccent),
                ));
      case '/third_screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                      title: "Third Screen", color: Colors.redAccent),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                      title: "Home Page", color: Colors.blueAccent),
                ));
    }
  }
}
