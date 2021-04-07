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
      : super(HomeLoading());

  bool isFetching = false;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeFetched) {
      _mapHomeFetchedToState(event, state);
    }
  }

  Stream<HomeState> _mapHomeFetchedToState(
      HomeEvent event, HomeState state) async* {
    yield HomeLoading();
    try {
      categoryBloc.add(CategoryFetched());
      recommendBloc.add(RecommendFetched());
      trendBloc.add(TrendFetched());
      categoryBloc.add(CategoryFetched());
      yield HomeSuccess(baseEntities: []);
    } catch (e) {
      yield HomeFailure(message: e.toString());
    }
  }
}
