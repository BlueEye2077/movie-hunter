import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/entities/search_results_entity.dart';
import '../../domain/repos/search_repository.dart';
import '../models/search_result_model.dart';
import '../web_services/search_api_service.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchApiService _searchApiService;

  const SearchRepositoryImpl({required SearchApiService searchApiService})
    : _searchApiService = searchApiService;

  @override
  Future<ApiResult<SearchResultsEntity>> search(String query) async {
    try {
      final response = await _searchApiService.search(query);
      final movies = <MovieEntity>[];
      final people = <PersonEntity>[];

      for (final searchResultModel
          in response.results ?? const <SearchResultModel>[]) {
        switch (searchResultModel) {
          case MovieSearchResult(:final movie):
            movies.add(movie.toEntity());
          case PersonSearchResult(:final personModel):
            if (personModel.isValid) {
              people.add(personModel.toEntity());
            }
          case UnsupportedSearchResult():
            break;
        }
      }

      return ApiResult.success(
        SearchResultsEntity(movies: movies, people: people),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
