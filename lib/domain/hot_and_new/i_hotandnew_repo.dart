import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new.dart';

abstract class HotAndNewService{
  Future<Either<MainFailures,HotAndNew>> getHotAndNewMovieData();
  Future<Either<MainFailures,HotAndNew>> getHotAndNewTvData();
}