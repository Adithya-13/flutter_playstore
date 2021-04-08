part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class HomeSuccess extends HomeState {
  final List<BaseEntity>? baseEntities;
  final bool? hasReachedMax;

  HomeSuccess({this.baseEntities, this.hasReachedMax});

  HomeSuccess copyWith({List<BaseEntity>? baseEntities, bool? hasReachedMax}) {
    return HomeSuccess(
        baseEntities: baseEntities ?? this.baseEntities,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [baseEntities!, hasReachedMax!];
}
