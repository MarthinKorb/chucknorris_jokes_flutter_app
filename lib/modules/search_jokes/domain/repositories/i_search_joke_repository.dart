import 'package:dartz/dartz.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';

abstract class ISearchJokeRepository {
  Future<Either<FailureSearch, Joke>> find();
}
