part of 'recommend_bloc.dart';

abstract class RecommendState extends Equatable {
  const RecommendState();

  @override
  List<Object> get props => [];
}

class RecommendLoading extends RecommendState {}

class RecommendFailure extends RecommendState {
  final String message;

  RecommendFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class RecommendSuccess extends RecommendState {
  final RecommendEntity recommendEntity;

  RecommendSuccess({required this.recommendEntity});

  @override
  List<Object> get props => [recommendEntity];
}
