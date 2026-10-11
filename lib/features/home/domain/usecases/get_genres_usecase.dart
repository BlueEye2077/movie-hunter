import '../../../../core/models/genre.dart';
import '../../../../core/networking/api_result.dart';
import '../repos/home_repository.dart';

class GetGenresUseCase {
  final HomeRepository _homeRepository;

  const GetGenresUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<ApiResult<List<Genre>>> call() {
    return _homeRepository.getGenres();
  }
}

