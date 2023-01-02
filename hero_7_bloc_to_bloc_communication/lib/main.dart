import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_6_bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:hero_6_bloc_access_navigation/logic/cubit/internet_cubit.dart';
import 'package:hero_6_bloc_access_navigation/presentation/router/AppRouter.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.connectivity});

  final AppRouter appRouter;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) =>
              CounterCubit(BlocProvider.of<InternetCubit>(context)),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
