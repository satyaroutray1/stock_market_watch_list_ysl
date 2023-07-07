import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_watch_list/data/repositories/repo.dart';
import 'package:stock_market_watch_list/presentation/screens/home_page.dart';

import 'bloc/market_bloc/market_bloc.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/watch_list_bloc/watch_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WatchListBloc>(
              create: (context) => WatchListBloc(Repo())),
          BlocProvider<MarketBloc>(
              create: (context) => MarketBloc(Repo())),
          BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: state,
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}


