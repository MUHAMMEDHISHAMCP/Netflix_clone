import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/api_end_point.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/hot_and_new/i_hotandnew_repo.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailures, HotAndNew>> getHotAndNewMovieData() async {
        try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.hotAndNewMovie,
       
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNew>> getHotAndNewTvData() async {
     try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.hotAndNewTv,
        
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }

}