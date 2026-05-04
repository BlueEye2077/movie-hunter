
import '../../data/models/movie_credits_response.dart';
import '../../data/models/movie_details_response.dart';

/// Combined state holding both movie details and credits.
class MovieDetailsData {
  final MovieDetailsResponse details;
  final MovieCreditsResponse credits;

  const MovieDetailsData({required this.details, required this.credits});
}

