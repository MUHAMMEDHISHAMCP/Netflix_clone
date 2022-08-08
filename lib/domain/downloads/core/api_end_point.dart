import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoint {
  static const download = "$kBasrUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBasrUrl/search/movie?api_key=$apiKey";

  static const hotAndNewMovie = "$kBasrUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$kBasrUrl/discover/tv?api_key=$apiKey";
}
