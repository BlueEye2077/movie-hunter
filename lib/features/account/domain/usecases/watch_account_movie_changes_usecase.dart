import '../entities/account_movie_change.dart';
import '../repos/account_repository.dart';

class WatchAccountMovieChangesUseCase {
  final AccountRepository _accountRepository;

  const WatchAccountMovieChangesUseCase({
    required this._accountRepository,
  });

  Stream<AccountMovieChange> call() {
    return _accountRepository.movieChanges;
  }
}

