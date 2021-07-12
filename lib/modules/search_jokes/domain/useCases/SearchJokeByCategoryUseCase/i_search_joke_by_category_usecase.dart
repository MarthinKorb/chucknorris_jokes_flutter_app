import 'package:dartz/dartz.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke_by_category.dart';

abstract class ISearchJokeByCategoryUseCase {
  Future<Either<FailureSearch, JokeByCategory>> call(String category);
}
