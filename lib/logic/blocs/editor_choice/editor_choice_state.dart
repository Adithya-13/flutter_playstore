part of 'editor_choice_bloc.dart';

abstract class EditorChoiceState extends Equatable {
  const EditorChoiceState();

  @override
  List<Object> get props => [];
}

class EditorChoiceLoading extends EditorChoiceState {}

class EditorChoiceFailure extends EditorChoiceState {
  final String message;

  EditorChoiceFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class EditorChoiceSuccess extends EditorChoiceState {
  final EditorChoiceEntity editorChoiceEntity;

  EditorChoiceSuccess({required this.editorChoiceEntity});

  @override
  List<Object> get props => [editorChoiceEntity];
}
