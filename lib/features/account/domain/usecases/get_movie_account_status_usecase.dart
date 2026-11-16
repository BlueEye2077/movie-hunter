import '../../../../core/networking/api_result.dart';
import '../entities/movie_account_status_entity.dart';
import '../repos/account_repository.dart';

class GetMovieAccountStatusUseCase {
  final AccountRepository _accountRepository;

  const GetMovieAccountStatusUseCase({
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  Future<ApiResult<MovieAccountStatusEntity>> call(int movieId) {
    return _accountRepository.getMovieAccountStatus(movieId);
  }
}

