import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_6_bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:hero_6_bloc_access_navigation/presentation/screens/home_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) {
          return BlocProvider.value(
            value: _counterCubit,
            child:
                const HomeScreen(title: "Home Page", color: Colors.blueAccent),
          );
        });
    }
  }
}
