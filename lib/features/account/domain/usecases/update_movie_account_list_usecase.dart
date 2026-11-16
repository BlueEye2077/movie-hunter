import '../../../../core/networking/api_result.dart';
import '../entities/account_movie_list_type.dart';
import '../repos/account_repository.dart';

class UpdateMovieAccountListUseCase {
  final AccountRepository _accountRepository;

  const UpdateMovieAccountListUseCase({
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  Future<ApiResult<void>> call({
    required AccountMovieListType listType,
    required int movieId,
    required bool isAdded,
  }) {
    return _accountRepository.updateMovieAccountList(
      listType: listType,
      movieId: movieId,
      isAdded: isAdded,
    );
  }
}

