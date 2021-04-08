part of 'top_free_bloc.dart';

abstract class TopFreeState extends Equatable {
  const TopFreeState();

  @override
  List<Object> get props => [];
}

class TopFreeLoading extends TopFreeState {}

class TopFreeFailure extends TopFreeState {
  final String message;

  TopFreeFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class TopFreeSuccess extends TopFreeState {
  final TopFreeEntity topFreeEntity;

  TopFreeSuccess({required this.topFreeEntity});

  @override
  List<Object> get props => [topFreeEntity];
}
