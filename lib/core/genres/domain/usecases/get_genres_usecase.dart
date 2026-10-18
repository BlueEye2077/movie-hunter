import '../../../networking/api_result.dart';
import '../entities/genre_entity.dart';
import '../repos/genres_repository.dart';

class GetGenresUseCase {
  final GenresRepository _genresRepository;

  const GetGenresUseCase({required GenresRepository genresRepository})
    : _genresRepository = genresRepository;

  Future<ApiResult<List<GenreEntity>>> call() {
    return _genresRepository.getGenres();
  }
}
