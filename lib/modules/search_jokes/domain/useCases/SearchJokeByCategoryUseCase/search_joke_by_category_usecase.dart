import 'package:dartz/dartz.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke_by_category.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/repositories/i_search_joke_repository.dart';

import 'i_search_joke_by_category_usecase.dart';

class SearchJokeByCategoryUseCase implements ISearchJokeByCategoryUseCase {
  final ISearchJokeRepository searchJokeRepository;

  SearchJokeByCategoryUseCase({required this.searchJokeRepository});

  @override
  Future<Either<FailureSearch, JokeByCategory>> call(String category) {
    return searchJokeRepository.findByCategory(category);
  }
}
