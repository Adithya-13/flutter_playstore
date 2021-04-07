import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:flutter_playstore/logic/blocs/home/home_bloc.dart';
import 'package:flutter_playstore/presentation/pages/base_page.dart';

void main() {
  Bloc.observer = PlayStoreBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<TrendRepository>(
        create: (context) => TrendRepository(),
      ),
      RepositoryProvider<RecommendRepository>(
        create: (context) => RecommendRepository(),
      ),
      RepositoryProvider<CategoryRepository>(
        create: (context) => CategoryRepository(),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<TrendBloc>(
          create: (context) =>
              TrendBloc(trendRepository: context.read<TrendRepository>())
                ..add(TrendFetched()),
        ),
        BlocProvider<RecommendBloc>(
          create: (context) => RecommendBloc(
              recommendRepository: context.read<RecommendRepository>())
            ..add(RecommendFetched()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>())
            ..add(CategoryFetched()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            categoryBloc: context.read<CategoryBloc>(),
            recommendBloc: context.read<RecommendBloc>(),
            trendBloc: context.read<TrendBloc>(),
          ),
        )
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
