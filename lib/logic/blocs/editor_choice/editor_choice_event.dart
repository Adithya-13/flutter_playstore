part of 'editor_choice_bloc.dart';

abstract class EditorChoiceEvent extends Equatable {
  const EditorChoiceEvent();

  @override
  List<Object?> get props => [];
}

class EditorChoiceFetched extends EditorChoiceEvent {}
