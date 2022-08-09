import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    final IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>(
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
          (r) => FastLaughState(
            videoList: r,
            isLoading: false,
            isError: false,
          ),
          // log(r.toString());
        );
        if (states != null) {
          emit(states);
        }
      },
    );

    on<LikedVideo>((event, emit) async {
      likedVideosIdNotifier.value.add(event.id);
    });

    on<UnlikeVideo>((event, emit) {
      likedVideosIdNotifier.value.remove(event.id);
    });
  }
}
