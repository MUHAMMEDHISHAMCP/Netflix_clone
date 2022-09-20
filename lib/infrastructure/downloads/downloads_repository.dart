import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/api_end_point.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.download);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
