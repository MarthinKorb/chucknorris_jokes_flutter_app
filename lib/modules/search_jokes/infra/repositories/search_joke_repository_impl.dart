import 'package:dartz/dartz.dart';

import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/repositories/i_search_joke_repository.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/infra/datasources/i_search_joke_datasource.dart';

class SearchJokeRepositoryImpl implements ISearchJokeRepository {
  final ISearchJokeDatasource searchJokeDatasource;

  const SearchJokeRepositoryImpl({required this.searchJokeDatasource});

  @override
  Future<Either<FailureSearch, Joke>> find() async {
    try {
      final result = await searchJokeDatasource.getJoke();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (err) {
      return Left(DatasourceError(message: err.toString()));
    }
  }
}
