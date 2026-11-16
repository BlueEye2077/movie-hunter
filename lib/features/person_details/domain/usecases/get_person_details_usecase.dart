import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/person_details_entity.dart';
import '../repos/person_details_repository.dart';

class GetPersonDetailsUseCase {
  static const int knownForLimit = 20;

  final PersonDetailsRepository _personDetailsRepository;
  final GenresRepository _genresRepository;

  const GetPersonDetailsUseCase({
    required PersonDetailsRepository personDetailsRepository,
    required GenresRepository genresRepository,
  }) : _personDetailsRepository = personDetailsRepository,
       _genresRepository = genresRepository;

  Future<ApiResult<PersonDetailsEntity>> call(int personId) async {
    final (genresResult, personResult) = await (
      _genresRepository.getGenres(),
      _personDetailsRepository.getPersonDetails(personId),
    ).wait;

    final List<GenreEntity> allGenres =
        genresResult.whenOrNull(success: (data) => data) ?? const [];

    return personResult.when(
      success: (person) {
        final curatedMovies = _curateMovies(
          rawMovies: person.allMovies,
          allGenres: allGenres,
        );

        return ApiResult.success(
          person.copyWith(
            knownFor: curatedMovies.take(knownForLimit).toList(),
            allMovies: curatedMovies,
          ),
        );
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  List<MovieEntity> _curateMovies({
    required List<MovieEntity> rawMovies,
    required List<GenreEntity> allGenres,
  }) {
    // 1. Filter out unusable entries (missing ID or poster) and deduplicate
    final Map<int, MovieEntity> uniqueMovies = {};
    for (final movie in rawMovies) {
      if (movie.id != null && (movie.posterPath?.trim().isNotEmpty ?? false)) {
        uniqueMovies.putIfAbsent(movie.id!, () => movie);
      }
    }

    // 2. Rank by vote count descending, with rating as tie-breaker
    final sortedMovies = uniqueMovies.values.toList()
      ..sort((a, b) {
        final voteCompare = (b.tmdbVoteCount ?? 0).compareTo(
          a.tmdbVoteCount ?? 0,
        );
        if (voteCompare != 0) return voteCompare;
        return (b.tmdbRating ?? 0.0).compareTo(a.tmdbRating ?? 0.0);
      });

    // 3. Single-pass genre enrichment
    return GenresHelper.enrichMovies(
      movies: sortedMovies,
      allGenres: allGenres,
    );
  }
}
