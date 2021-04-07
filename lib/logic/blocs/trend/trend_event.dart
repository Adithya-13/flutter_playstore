part of 'trend_bloc.dart';

abstract class TrendEvent extends Equatable {
  const TrendEvent();

  @override
  List<Object?> get props => [];
}

class TrendFetched extends TrendEvent {}
