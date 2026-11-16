import '../../../networking/api_result.dart';
import '../../../networking/network_exceptions.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/repos/genres_repository.dart';
import '../web_services/genres_api_services.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresApiServices _genresApiService;

  List<GenreEntity> _cachedGenresList = [];
  Future<ApiResult<List<GenreEntity>>>? _genresListInflight;

  GenresRepositoryImpl(this._genresApiService);

  // Get genres list
  @override
  Future<ApiResult<List<GenreEntity>>> getGenres() async {
    if (_cachedGenresList.isNotEmpty) {
      return ApiResult.success(_cachedGenresList);
    } else if (_genresListInflight != null) {
      return _genresListInflight!;
    } else {
      try {
        _genresListInflight = _fetchGenres();
        return await _genresListInflight!;
      } finally {
        _genresListInflight = null;
      }
    }
  }

  Future<ApiResult<List<GenreEntity>>> _fetchGenres() async {
    try {
      final response = await _genresApiService.getGenres();
      _cachedGenresList =
          response.genres?.map((e) => e.toEntity()).toList() ?? [];
      return ApiResult.success(_cachedGenresList);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
