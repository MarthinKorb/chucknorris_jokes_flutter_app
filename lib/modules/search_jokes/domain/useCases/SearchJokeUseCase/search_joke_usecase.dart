import 'package:dartz/dartz.dart';

import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/repositories/i_search_joke_repository.dart';

import 'i_search_joke_usecase.dart';

class SearchJokeUseCase implements ISearchJokeUseCase {
  final ISearchJokeRepository searchJokeRepository;

  const SearchJokeUseCase({required this.searchJokeRepository});

  @override
  Future<Either<FailureSearch, Joke>> call() {
    return searchJokeRepository.find();
  }
}
