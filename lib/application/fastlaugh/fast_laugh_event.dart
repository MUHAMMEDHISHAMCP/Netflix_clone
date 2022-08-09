part of '../fastlaugh/fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;

  const factory FastLaughEvent.likedVideo({
    required int id,
  }) = LikedVideo;

  const factory FastLaughEvent.unlikeVideo({
    required int id,
  }) = UnlikeVideo;
}
