import '../../../../core/networking/api_result.dart';
import '../entities/movie_details_entity.dart';
import '../repos/movie_details_repository.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  const GetMovieDetailsUseCase({
    required MovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  Future<ApiResult<MovieDetailsEntity>> call(int movieId) {
    return _movieDetailsRepository.getMovieDetails(movieId);
  }
}

