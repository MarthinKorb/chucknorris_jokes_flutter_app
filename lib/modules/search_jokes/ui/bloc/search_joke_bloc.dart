import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/useCases/SearchJokeUseCase/i_search_joke_usecase.dart';
import 'package:meta/meta.dart';

part 'search_joke_state.dart';

class SearchJokeBloc extends Bloc<Function, SearchJokeState> {
  final ISearchJokeUseCase useCase;

  SearchJokeBloc({required this.useCase}) : super(SearchJokeInitial());

  @override
  Stream<SearchJokeState> mapEventToState(Function event) async* {
    yield SearchJokeLoading();
    final result = await useCase.call();
    yield result.fold(
      (l) => SearchJokeError(l),
      (r) => SearchJokeSuccess(joke: r),
    );
  }
}
