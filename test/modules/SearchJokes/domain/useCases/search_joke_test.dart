import 'package:dartz/dartz.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/repositories/i_search_joke_repository.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/useCases/SearchJokeUseCase/search_joke_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchJokeRepositoryMock extends Mock implements ISearchJokeRepository {}

main() {
  final searchJokeRepository = SearchJokeRepositoryMock();
  final useCase = SearchJokeUseCase(searchJokeRepository: searchJokeRepository);
  test('it should return a joke when it\'s called SearchJokeUseCase', () async {
    when(() => searchJokeRepository.find())
        .thenAnswer((_) async => Right(Joke()));

    final result = await useCase();

    expect(result, isA<Right>());
  });
  test(
      'it should return a FailureSearch when it happens an error during the search',
      () async {
    when(() => searchJokeRepository.find())
        .thenAnswer((_) async => Left(SearchFailed()));

    final result = await useCase();
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<SearchFailed>());
  });
}
