import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/i_search_repo.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
  part 'search_bloc.freezed.dart';
  
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    on<initial>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final result = await _downloadService.getDownloadsImage();
      final states = result.fold(
        (MainFailures f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );
      emit(states);
    });

    on<searchMovies>(
      (event, emit) async {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: true,
            isError: false));

        final results =
            await _searchService.searchMovies(movieQuery: event.movieQuery);
        final states = results.fold(
          (MainFailures l) {
            return const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true);
          },
          (SearchResponse r) {
            return SearchState(
                searchResultList: r.results,
                idleList: [],
                isLoading: false,
                isError: false);
          },
        );
        emit(states);
      },
    );
  }
}
