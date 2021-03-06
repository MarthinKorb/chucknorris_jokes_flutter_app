import 'package:dio/dio.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';

import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke_by_category.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/infra/datasources/i_search_joke_datasource.dart';

class SearchChuckNorrisJokeDatasource implements ISearchJokeDatasource {
  final Dio dio;

  const SearchChuckNorrisJokeDatasource({required this.dio});

  @override
  Future<Joke> getJoke() async {
    final response = await dio.get('https://api.chucknorris.io/jokes/random');

    if (response.statusCode == 200) {
      return Joke.fromMap(response.data);
    } else {
      throw DatasourceError(message: 'The joke is the error');
    }
  }

  @override
  Future<JokeByCategory> getJokeByCategory(String category) async {
    final response = await dio
        .get('https://api.chucknorris.io/jokes/random?category=$category');

    if (response.statusCode == 200) {
      return JokeByCategory.fromMap(response.data);
    } else {
      throw DatasourceError(
          message: 'We could not found this category: $category');
    }
  }
}
