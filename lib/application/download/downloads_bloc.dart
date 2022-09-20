import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';

import '../../domain/downloads/models/downloads.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadState.initial()) {
    on<_GetDownloadsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            downloadFailureOrSuccessOption: none(),
            isLoading: true,
          ),
        );
        final Either<MainFailures, List<Downloads>> downloadOptions =
            await _downloadsRepo.getDownloadsImage();
        log(downloadOptions.toString());

        emit(downloadOptions.fold(
            (failure) => state.copyWith(
                  isLoading: false,
                  downloadFailureOrSuccessOption: some(left(failure)),
                ),
            (success) => state.copyWith(
                isLoading: false,
                downloads: success,
                downloadFailureOrSuccessOption: some(right(success)))));
      },
    );
  }
}
