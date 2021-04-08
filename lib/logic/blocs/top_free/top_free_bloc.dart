import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';

part 'top_free_event.dart';

part 'top_free_state.dart';

class TopFreeBloc extends Bloc<TopFreeEvent, TopFreeState> {
  final GameRepository _gameRepository;

  TopFreeBloc({required GameRepository gameRepository})
      : _gameRepository = gameRepository,
        super(TopFreeLoading());

  @override
  Stream<TopFreeState> mapEventToState(
    TopFreeEvent event,
  ) async* {
    yield* _mapTopFreeFetchedToState(event);
  }

  Stream<TopFreeState> _mapTopFreeFetchedToState(TopFreeEvent event) async* {
    // yield TopFreeLoading();
    try {
      TopFreeEntity topFreeEntity = await _gameRepository.getTopFreeList();
      yield TopFreeSuccess(topFreeEntity: topFreeEntity);
    } catch (e) {
      yield TopFreeFailure(message: e.toString());
    }
  }
}
