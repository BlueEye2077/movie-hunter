import '../entities/account_movie_change.dart';
import '../repos/account_repository.dart';

class WatchAccountMovieChangesUseCase {
  final AccountRepository _accountRepository;

  const WatchAccountMovieChangesUseCase({
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  Stream<AccountMovieChange> call() {
    return _accountRepository.movieChanges;
  }
}

