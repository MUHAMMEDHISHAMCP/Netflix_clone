import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/hot_and_new/i_hotandnew_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeService;
  HomeBloc(this.homeService) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      emit(state.copyWith(isLoading: true)); 

      final movieResult = await homeService.getHotAndNewMovieData();
      final tvResult = await homeService.getHotAndNewTvData();

 final state1 =     movieResult.fold(
        (MainFailures l) {
          return  HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYear: [],
            trending: [],
            topTvShows: [],
            tenseDrama: [],
            southIndian: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNew r) {
          final pastYearMovie = r.results;
          final trendingList = r.results;
          final tenseDramaMovie = r.results;
          final southIndianMovie = r.results;

          pastYearMovie.shuffle();
          tenseDramaMovie.shuffle();
          southIndianMovie.shuffle();

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYear: pastYearMovie,
            trending: trendingList,
            topTvShows: state.topTvShows,
            tenseDrama: tenseDramaMovie,
            southIndian: southIndianMovie,
            isLoading: false,
            isError: false,
          );
        },
      );
emit(state1);


    final state2 = tvResult.fold(
        (MainFailures l) {
          return  HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYear: [],
            trending: [],
            topTvShows: [],
            tenseDrama: [],
            southIndian: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNew r) {
          final topTvShowsData = r.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYear: state.pastYear,
            trending: state.trending,
            topTvShows: topTvShowsData,
            tenseDrama: state.tenseDrama,
            southIndian: state.southIndian,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(state2);
    });
  }
}
