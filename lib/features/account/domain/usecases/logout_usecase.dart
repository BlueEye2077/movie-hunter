import '../../../../core/networking/api_result.dart';
import '../repos/account_repository.dart';

class LogoutUseCase {
  final AccountRepository _accountRepository;

  const LogoutUseCase({
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  Future<ApiResult<void>> call() {
    return _accountRepository.logout();
  }
}

