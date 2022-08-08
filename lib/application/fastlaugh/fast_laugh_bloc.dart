import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrl = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    final IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<initialize>(
      (event, emit) async {
       emit(const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ));

        final result = await downloadService.getDownloadsImage();
        final states = result.fold(
          (l) {
            const FastLaughState(
              videoList: [],
              isLoading: false,
              isError: true,
            );
          },
          (r) {
            FastLaughState(
              videoList: r,
              isLoading: false,
              isError: false,
            );
            log(r.toString());
          },
        );
        // log(states.toString());

        emit(states);
      },
    );
  }
}
