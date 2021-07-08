abstract class FailureSearch implements Exception {}

class SearchFailed implements FailureSearch {
  final String? message;

  SearchFailed({this.message});
}

class DatasourceError implements FailureSearch {
  final String? message;

  DatasourceError({this.message});
}
