import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/failures/main_failure.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
