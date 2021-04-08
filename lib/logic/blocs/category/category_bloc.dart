import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/data/repositories/repositories.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HomeRepository _homeRepository;

  CategoryBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryFetched) {
      yield* _mapCategoryFetchedToState(event);
    }
  }

  Stream<CategoryState> _mapCategoryFetchedToState(
      CategoryFetched event) async* {
    // yield CategoryLoading();
    try {
      CategoryEntity categoryEntity = await _homeRepository.getCategoryList();
      yield CategorySuccess(categoryEntity: categoryEntity);
    } catch (e) {
      yield CategoryFailure(message: e.toString());
    }
  }
}
