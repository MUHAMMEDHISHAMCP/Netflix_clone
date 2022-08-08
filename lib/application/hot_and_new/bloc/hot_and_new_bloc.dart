import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/hot_and_new/i_hotandnew_repo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService hotAndNewService;
  HotAndNewBloc(this.hotAndNewService) : super(HotAndNewState.initial()) {
/*
get hot and movie data
*/
    on<loadDataInComingSoon>((event, emit) async {
      emit(const HotAndNewState(
        comingSoonList: [],
        everyOneList: [],
        isLoading: true,
        isError: false,
      ));

      final result = await hotAndNewService.getHotAndNewMovieData();
      final newstate = result.fold((MainFailures l) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNew r) {
        return HotAndNewState(
          comingSoonList: r.results,
          everyOneList: [],
          isLoading: false,
          isError: false,
        );
      });
      emit(newstate);
    });


/*
get hot and tv data
*/
    on<loadDataInEveryOne>((event, emit) async {
      emit(const HotAndNewState(
        comingSoonList: [],
        everyOneList: [],
        isLoading: true,
        isError: false,
      ));

      final result = await hotAndNewService.getHotAndNewTvData();
      final newstate = result.fold((MainFailures l) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNew r) {
        return HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyOneList: r.results,
          isLoading: false,
          isError: false,
        );
      });
      emit(newstate);
    });
  }
}
