import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/search_results_entity.dart';
import '../repos/search_repository.dart';

class SearchUseCase {
  final SearchRepository _searchRepository;
  final GenresRepository _genresRepository;

  const SearchUseCase({
    required SearchRepository searchRepository,
    required GenresRepository genresRepository,
  })  : _searchRepository = searchRepository,
        _genresRepository = genresRepository;

  Future<ApiResult<SearchResultsEntity>> call(String query) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) {
      return ApiResult.success(const SearchResultsEntity());
    }

    final (genresResult, searchResult) = await (
      _genresRepository.getGenres(),
      _searchRepository.search(trimmedQuery),
    ).wait;

    final List<GenreEntity> allGenres =
        genresResult.whenOrNull(success: (data) => data) ?? const [];

    return searchResult.when(
      success: (data) {
        final enrichedMovies = GenresHelper.enrichMovies(
          movies: data.movies,
          allGenres: allGenres,
        );
        return ApiResult.success(
          SearchResultsEntity(
            movies: enrichedMovies,
            people: data.people,
          ),
        );
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}

