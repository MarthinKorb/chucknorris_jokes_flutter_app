import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/useCases/SearchJokeByCategoryUseCase/i_search_joke_by_category_usecase.dart';
import 'package:meta/meta.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke_by_category.dart';
part 'search_joke_by_category_state.dart';

class SearchJokeByCategoryBloc extends Bloc<String, SearchJokeByCategoryState> {
  final ISearchJokeByCategoryUseCase useCase;

  SearchJokeByCategoryBloc({required this.useCase})
      : super(SearchJokeByCategoryInitial());

  @override
  Stream<SearchJokeByCategoryState> mapEventToState(
    String category,
  ) async* {
    yield SearchJokeByCategoryLoading();
    final result = await useCase.call(category);
    yield result.fold((l) => SearchJokeByCategoryError(l),
        (r) => SearchJokeByCategorySuccess(r));
  }
}
