part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required String stateId,
      required List<HotAndNewData> pastYear,
      required List<HotAndNewData> trending,
      required List<HotAndNewData> topTvShows,
      required List<HotAndNewData> tenseDrama,
      required List<HotAndNewData> southIndian,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory HomeState.initial() => const HomeState(
        stateId: '0',
        pastYear: [],
        trending: [],
        topTvShows: [],
        tenseDrama: [],
        southIndian: [],
        isLoading: false,
        isError: false,
      );
}
