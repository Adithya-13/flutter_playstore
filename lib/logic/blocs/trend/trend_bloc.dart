import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';

part 'trend_event.dart';

part 'trend_state.dart';

class TrendBloc extends Bloc<TrendEvent, TrendState> {
  final TrendRepository _trendRepository;

  TrendBloc({required TrendRepository trendRepository})
      : _trendRepository = trendRepository,
        super(TrendLoading());

  @override
  Stream<TrendState> mapEventToState(
    TrendEvent event,
  ) async* {
    if (event is TrendFetched) {
      yield* _mapTrendFetchedToState(event);
    }
  }

  Stream<TrendState> _mapTrendFetchedToState(TrendFetched event) async* {
    // yield TrendLoading();
    try {
      TrendEntity trendEntity = await _trendRepository.getTrendList();
      yield TrendSuccess(trendEntity: trendEntity);
    } catch (e) {
      yield TrendFailure(message: e.toString());
    }
  }
}
