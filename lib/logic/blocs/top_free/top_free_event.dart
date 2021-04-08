part of 'top_free_bloc.dart';

abstract class TopFreeEvent extends Equatable {
  const TopFreeEvent();
  @override
  List<Object?> get props => [];
}

class TopFreeFetched extends TopFreeEvent {}
