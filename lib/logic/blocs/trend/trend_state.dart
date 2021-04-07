part of 'trend_bloc.dart';

abstract class TrendState extends Equatable {
  const TrendState();

  @override
  List<Object> get props => [];
}

class TrendLoading extends TrendState {}

class TrendFailure extends TrendState {
  final String message;

  TrendFailure({required this.message});
}

class TrendSuccess extends TrendState {
  final TrendEntity trendEntity;

  TrendSuccess({required this.trendEntity});

  @override
  List<Object> get props => [trendEntity];
}
