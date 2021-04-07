part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class HomeSuccess extends HomeState {
  final List<BaseEntity> baseEntities;

  HomeSuccess({required this.baseEntities});
}
