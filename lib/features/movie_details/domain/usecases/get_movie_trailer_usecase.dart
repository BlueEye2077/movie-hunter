import '../../../../core/networking/api_result.dart';
import '../entities/movie_video_entity.dart';
import '../repos/movie_details_repository.dart';

class GetMovieTrailerUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  const GetMovieTrailerUseCase({
    required MovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  Future<ApiResult<String?>> call(int movieId) async {
    final response = await _movieDetailsRepository.getMovieVideos(movieId);
    return response.when(
      success: (data) {
        final trailer = selectTrailer(data);
        return ApiResult.success(trailer?.key);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}

MovieVideoEntity? selectTrailer(List<MovieVideoEntity> videos) {
  final predicates = <bool Function(MovieVideoEntity)>[
    (v) =>
        v.site == VideoSite.youTube &&
        v.type == VideoType.trailer &&
        v.isOfficial,
    (v) => v.site == VideoSite.youTube && v.type == VideoType.trailer,
    (v) =>
        v.site == VideoSite.youTube &&
        v.type == VideoType.teaser &&
        v.isOfficial,
  ];

  for (final predicate in predicates) {
    for (final video in videos) {
      if (predicate(video) && video.key.isNotEmpty) return video;
    }
  }
  return null;
}
