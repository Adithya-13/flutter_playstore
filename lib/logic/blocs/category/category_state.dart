part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class CategorySuccess extends CategoryState {
  final CategoryEntity categoryEntity;

  CategorySuccess({required this.categoryEntity});
}
