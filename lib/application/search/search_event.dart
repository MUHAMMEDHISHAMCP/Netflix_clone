part of '../search/search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initial() = initial;
  const factory SearchEvent.searchMovies({
    required String movieQuery,
  }) = searchMovies;
}
