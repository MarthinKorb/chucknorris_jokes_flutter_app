import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/domain/useCases/SearchJokeByCategoryUseCase/search_joke_by_category_usecase.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/search_joke_bloc/search_joke_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/search_joke_by_category_bloc/search_joke_by_category_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search_jokes/domain/repositories/i_search_joke_repository.dart';
import 'modules/search_jokes/domain/useCases/SearchJokeByCategoryUseCase/i_search_joke_by_category_usecase.dart';
import 'modules/search_jokes/domain/useCases/SearchJokeUseCase/i_search_joke_usecase.dart';
import 'modules/search_jokes/domain/useCases/SearchJokeUseCase/search_joke_usecase.dart';
import 'modules/search_jokes/external/datasources/chucknorris_api_datasource.dart';
import 'modules/search_jokes/infra/datasources/i_search_joke_datasource.dart';
import 'modules/search_jokes/infra/repositories/search_joke_repository_impl.dart';
import 'modules/search_jokes/ui/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind<ISearchJokeUseCase>(
            (i) => SearchJokeUseCase(searchJokeRepository: i())),
        Bind<ISearchJokeRepository>(
            (i) => SearchJokeRepositoryImpl(searchJokeDatasource: i())),
        Bind<ISearchJokeDatasource>(
            (i) => SearchChuckNorrisJokeDatasource(dio: i())),
        Bind<Bloc>((i) => SearchJokeBloc(useCase: i())),
        Bind<Bloc>((i) => SearchJokeByCategoryBloc(useCase: i())),
        Bind<ISearchJokeByCategoryUseCase>(
            (i) => SearchJokeByCategoryUseCase(searchJokeRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SearchPage()),
      ];
}
