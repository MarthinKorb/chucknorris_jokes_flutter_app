import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';

abstract class ISearchJokeDatasource {
  Future<Joke> getJoke();
}
