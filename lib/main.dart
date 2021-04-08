import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:flutter_playstore/presentation/pages/pages.dart';

void main() {
  Bloc.observer = PlayStoreBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<HomeRepository>(
        create: (context) => HomeRepository(),
      ),
      RepositoryProvider<GameRepository>(
        create: (context) => GameRepository(),
      )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<TrendBloc>(
          create: (context) =>
              TrendBloc(homeRepository: context.read<HomeRepository>()),
        ),
        BlocProvider<RecommendBloc>(
          create: (context) =>
              RecommendBloc(homeRepository: context.read<HomeRepository>()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(homeRepository: context.read<HomeRepository>()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            categoryBloc: context.read<CategoryBloc>(),
            recommendBloc: context.read<RecommendBloc>(),
            trendBloc: context.read<TrendBloc>(),
          )..add(HomeFetched()),
        ),
        BlocProvider<EditorChoiceBloc>(
          create: (context) => EditorChoiceBloc(
            gameRepository: context.read<GameRepository>(),
          )..add(EditorChoiceFetched()),
        ),
        BlocProvider<TopFreeBloc>(
          create: (context) => TopFreeBloc(
            gameRepository: context.read<GameRepository>(),
          )..add(TopFreeFetched()),
        ),
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playstore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BasePage(),
    );
  }
}
