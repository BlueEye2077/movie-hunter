import '../../../../core/networking/api_result.dart';
import '../entities/credit_entity.dart';
import '../entities/movie_credits_entity.dart';
import '../repos/movie_details_repository.dart';


class GetMovieCreditsUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  const GetMovieCreditsUseCase({
    required MovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  Future<ApiResult<MovieCreditsEntity>> call(int movieId) async {
    final response = await _movieDetailsRepository.getMovieCredits(movieId);

    return response.when(
      success: (data) {
        final directors = <CreditEntity>[];
        final writers = <CreditEntity>[];
        final cast = <CreditEntity>[];
        final seenDirectorIds = <int>{};
        final seenWriterIds = <int>{};

        // 1. Process crew members
        for (final crewMember in data.crew) {
          final job = crewMember.job.trim().toLowerCase();
          if (job == "director") {
            if (seenDirectorIds.add(crewMember.id)) {
              directors.add(
                CreditEntity(
                  id: crewMember.id,
                  name: crewMember.name,
                  role: crewMember.job,
                  profilePath: crewMember.profilePath,
                ),
              );
            }
          } else if (job == "writer" || job == "screenplay") {
            if (seenWriterIds.add(crewMember.id)) {
              writers.add(
                CreditEntity(
                  id: crewMember.id,
                  name: crewMember.name,
                  role: crewMember.job,
                  profilePath: crewMember.profilePath,
                ),
              );
            }
          }
        }

        // 2. Process cast members
        for (final castMember in data.cast) {
          cast.add(
            CreditEntity(
              id: castMember.id,
              name: castMember.name,
              role: castMember.character,
              profilePath: castMember.profilePath,
            ),
          );
        }

        return ApiResult.success(
          MovieCreditsEntity(
            directors: directors,
            writers: writers,
            cast: cast,
            highlights: [...directors, ...writers, ...cast],
          ),
        );
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
