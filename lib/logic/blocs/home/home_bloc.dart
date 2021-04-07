import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryBloc categoryBloc;
  final RecommendBloc recommendBloc;
  final TrendBloc trendBloc;

  HomeBloc(
      {required this.categoryBloc,
      required this.recommendBloc,
      required this.trendBloc})
      : super(HomeInitial());

  List<BaseEntity> baseEntities = List<BaseEntity>.empty(growable: true);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeFetched && !_hasReachedMax(state)) {
      yield* _mapHomeFetchedToState(event, state);
    }
  }

  Stream<HomeState> _mapHomeFetchedToState(
      HomeEvent event, HomeState state) async* {
    try {
      if (state is HomeInitial) {
        await Future.delayed(Duration(seconds: 5));

        trendBloc.add(TrendFetched());
        recommendBloc.add(RecommendFetched());
        categoryBloc.add(CategoryFetched());

        categoryBloc.stream.listen((event) {
          if (event is CategorySuccess) {
            baseEntities.add(event.categoryEntity);
          }
        });

        recommendBloc.stream.listen((event) {
          if (event is RecommendSuccess) {
            baseEntities.add(event.recommendEntity);
          }
        });

        trendBloc.stream.listen((event) {
          if (event is TrendSuccess) {
            baseEntities.add(event.trendEntity);
          }
        });
        yield HomeSuccess(baseEntities: baseEntities, hasReachedMax: false);
      } else if (state is HomeSuccess) {
        await Future.delayed(Duration(seconds: 5));

        trendBloc.add(TrendFetched());
        recommendBloc.add(RecommendFetched());
        categoryBloc.add(CategoryFetched());

        categoryBloc.stream.listen((event) {
          if (event is CategorySuccess) {
            baseEntities.add(event.categoryEntity);
          }
        });

        recommendBloc.stream.listen((event) {
          if (event is RecommendSuccess) {
            baseEntities.add(event.recommendEntity);
          }
        });

        trendBloc.stream.listen((event) {
          if (event is TrendSuccess) {
            baseEntities.add(event.trendEntity);
          }
        });
        yield baseEntities.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : HomeSuccess(baseEntities: state.baseEntities! + baseEntities);
      }
    } catch (e) {
      yield HomeFailure(message: e.toString());
    }
  }

  bool _hasReachedMax(HomeState state) =>
      state is HomeSuccess && state.hasReachedMax!;
}
