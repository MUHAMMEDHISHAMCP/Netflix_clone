part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required List<HotAndNewData> comingSoonList,
      required List<HotAndNewData> everyOneList,
      required bool isLoading,
      required bool isError}) = HotAndNewStatel;

  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        everyOneList: [],
        isLoading: false,
        isError: false,
      );
}
