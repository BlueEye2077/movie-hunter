import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/account_entity.dart';
import '../entities/account_movie_change.dart';
import '../entities/account_movie_list_type.dart';
import '../entities/movie_account_status_entity.dart';

abstract class AccountRepository {
  Stream<AccountMovieChange> get movieChanges;

  Future<ApiResult<AccountEntity>> getAccountDetails();

  Future<ApiResult<PaginatedList<MovieEntity>>> getAccountMovies({
    required AccountMovieListType listType,
    int page = 1,
  });

  Future<ApiResult<MovieAccountStatusEntity>> getMovieAccountStatus(int movieId);

  Future<ApiResult<void>> updateMovieAccountList({
    required AccountMovieListType listType,
    required int movieId,
    required bool isAdded,
  });

  Future<ApiResult<void>> logout();
}

