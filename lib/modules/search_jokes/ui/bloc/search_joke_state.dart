part of 'search_joke_bloc.dart';

@immutable
abstract class SearchJokeState {}

class SearchJokeInitial extends SearchJokeState {}

class SearchJokeSuccess extends SearchJokeState {
  final Joke joke;

  SearchJokeSuccess({required this.joke});
}

class SearchJokeLoading extends SearchJokeState {}

class SearchJokeError extends SearchJokeState {
  final FailureSearch? failureSearch;

  SearchJokeError([this.failureSearch]);
}
