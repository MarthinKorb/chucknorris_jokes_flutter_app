import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/models/joke.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/infra/datasources/i_search_joke_datasource.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/infra/repositories/search_joke_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchJokeDataSourceMock extends Mock implements ISearchJokeDatasource {}

void main() {
  final datasource = SearchJokeDataSourceMock();
  final repository = SearchJokeRepositoryImpl(searchJokeDatasource: datasource);

  test('it should return a joke when it\'s called datasource', () async {
    when(() => datasource.getJoke()).thenAnswer((_) async => Joke());

    final result = await repository.find();

    expect(result.fold((l) => l, (r) => r), isA<Joke>());
  });

  test(
      'it should return a DatasourceError when it happens an error during the flow',
      () async {
    when(() => datasource.getJoke()).thenThrow(DatasourceError());

    final result = await repository.find();

    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
