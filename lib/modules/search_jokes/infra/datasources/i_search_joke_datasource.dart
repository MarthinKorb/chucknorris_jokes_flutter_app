import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke_by_category.dart';

abstract class ISearchJokeDatasource {
  Future<Joke> getJoke();
  Future<JokeByCategory> getJokeByCategory(String category);
}
