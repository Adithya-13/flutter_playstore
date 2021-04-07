import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';

part 'recommend_event.dart';

part 'recommend_state.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> {
  final RecommendRepository _recommendRepository;

  RecommendBloc({required RecommendRepository recommendRepository})
      : _recommendRepository = recommendRepository,
        super(RecommendLoading());

  @override
  Stream<RecommendState> mapEventToState(
    RecommendEvent event,
  ) async* {
    if (event is RecommendFetched) {
      yield* _mapRecommendFetchedToState(event);
    }
  }

  Stream<RecommendState> _mapRecommendFetchedToState(
      RecommendFetched event) async* {
    yield RecommendLoading();
    try {
      RecommendEntity trendEntity =
          await _recommendRepository.getRecommendList();
      yield RecommendSuccess(recommendEntity: trendEntity);
    } catch (e) {
      yield RecommendFailure(message: e.toString());
    }
  }
}
