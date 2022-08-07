import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage();
}
