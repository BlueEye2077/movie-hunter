import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../entities/category_entity.dart';
import '../repos/categories_repository.dart';

class GetCategoriesUseCase {
  static const int _batchSize = 4;

  final CategoriesRepository _categoriesRepository;
  final GenresRepository _genresRepository;

  GetCategoriesUseCase({
    required CategoriesRepository categoriesRepository,
    required GenresRepository genresRepository,
  }) : _categoriesRepository = categoriesRepository,
       _genresRepository = genresRepository;

  Future<ApiResult<List<CategoryEntity>>> call() async {
    final genresResult = await _genresRepository.getGenres();

    return genresResult.when(
      failure: (error) => ApiResult.failure(error),
      success: (data) async {
        final genres = data
            .where((g) => g.id != null && g.name != null)
            .toList();
        final moviesResult = await _fetchMoviesByGenre(genres);

        return moviesResult.when(
          failure: (error) => ApiResult.failure(error),
          success: (moviesByGenre) {
            final categories = _buildCategories(genres, moviesByGenre);
            return ApiResult.success(categories);
          },
        );
      },
    );
  }

  Future<ApiResult<Map<int, List<MovieEntity>>>> _fetchMoviesByGenre(
    List<GenreEntity> genres,
  ) async {
    final Map<int, List<MovieEntity>> moviesByGenre = {};
    NetworkExceptions? firstError;

    for (var i = 0; i < genres.length; i += _batchSize) {
      final batch = genres.skip(i).take(_batchSize);
      await Future.wait(
        batch.map((genre) async {
          final result = await _categoriesRepository.getMoviesByGenre(
            genreId: genre.id!,
            page: 1,
          );
          result.when(
            success: (response) {
              moviesByGenre[genre.id!] = _enrichMovieGenreNames(
                response.results,
                genres,
              );
            },
            failure: (error) => firstError ??= error,
          );
        }),
      );
    }

    if (moviesByGenre.isEmpty && firstError != null) {
      return ApiResult.failure(firstError!);
    }

    return ApiResult.success(moviesByGenre);
  }

  List<MovieEntity> _enrichMovieGenreNames(
    List<MovieEntity> movies,
    List<GenreEntity> allGenres,
  ) {
    return movies
        .map(
          (movie) => movie.copyWith(
            genreNames: GenresHelper.getGenreTitles(
              genreIds: movie.genreIds,
              allGenres: allGenres,
            ),
          ),
        )
        .toList();
  }

  List<CategoryEntity> _buildCategories(
    List<GenreEntity> genres,
    Map<int, List<MovieEntity>> moviesByGenre,
  ) {
    final Set<String> usedImages = {};

    return genres.map((genre) {
      final movies = moviesByGenre[genre.id!] ?? const [];
      final imageUrl = _selectUniqueImage(movies, usedImages);

      return CategoryEntity(
        id: genre.id!,
        name: genre.name!,
        imageUrl: imageUrl,
        initialMovies: movies,
      );
    }).toList();
  }

  String _selectUniqueImage(List<MovieEntity> movies, Set<String> usedImages) {
    // 1. Try to find a unique image not yet claimed by an earlier category
    for (final movie in movies) {
      final image = movie.horizontalPoster ?? movie.posterPath;
      if (image != null && image.isNotEmpty && !usedImages.contains(image)) {
        usedImages.add(image);
        return image;
      }
    }

    // 2. Fallback: reuse the first available image if all were claimed
    for (final movie in movies) {
      final fallback = movie.horizontalPoster ?? movie.posterPath;
      if (fallback != null && fallback.isNotEmpty) {
        return fallback;
      }
    }

    return '';
  }
}
