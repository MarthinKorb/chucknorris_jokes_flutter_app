part of 'search_joke_by_category_bloc.dart';

@immutable
abstract class SearchJokeByCategoryState {}

class SearchJokeByCategoryInitial extends SearchJokeByCategoryState {}

class SearchJokeByCategorySuccess extends SearchJokeByCategoryState {
  final JokeByCategory jokeByCategory;

  SearchJokeByCategorySuccess(this.jokeByCategory);
}

class SearchJokeByCategoryLoading extends SearchJokeByCategoryState {}

class SearchJokeByCategoryError extends SearchJokeByCategoryState {
  final FailureSearch? message;

  SearchJokeByCategoryError([this.message]);
}
