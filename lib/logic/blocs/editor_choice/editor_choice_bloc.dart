import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';

part 'editor_choice_event.dart';

part 'editor_choice_state.dart';

class EditorChoiceBloc extends Bloc<EditorChoiceEvent, EditorChoiceState> {
  final GameRepository _gameRepository;

  EditorChoiceBloc({required GameRepository gameRepository})
      : _gameRepository = gameRepository,
        super(EditorChoiceLoading());

  @override
  Stream<EditorChoiceState> mapEventToState(
    EditorChoiceEvent event,
  ) async* {
    if (event is EditorChoiceFetched) {
      yield* _mapEditorChoiceFetchedToState(event);
    }
  }

  Stream<EditorChoiceState> _mapEditorChoiceFetchedToState(
      EditorChoiceEvent event) async* {
    // yield EditorChoiceLoading();
    try {
      EditorChoiceEntity editorChoiceEntity =
          await _gameRepository.getEditorChoiceList();
      yield EditorChoiceSuccess(editorChoiceEntity: editorChoiceEntity);
    } catch (e) {
      yield EditorChoiceFailure(message: e.toString());
    }
  }
}
