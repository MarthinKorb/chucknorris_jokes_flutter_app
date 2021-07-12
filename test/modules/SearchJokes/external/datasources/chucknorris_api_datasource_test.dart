import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/errors/errors.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/external/datasources/chucknorris_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioForNative {}

main() {
  final dio = DioMock();
  final datasource = SearchChuckNorrisJokeDatasource(dio: dio);

  test('it must return an error if statuscode is different then 200', () async {
    when(() => dio.get('https://api.chucknorris.io/jokes/random')).thenAnswer(
      (_) async => Response(
        data: {},
        statusCode: 400,
        requestOptions:
            RequestOptions(path: 'https://api.chucknorris.io/jokes/random'),
      ),
    );

    final result = await datasource.getJoke();
    expect(result, isA<DatasourceError>());
  });
}
