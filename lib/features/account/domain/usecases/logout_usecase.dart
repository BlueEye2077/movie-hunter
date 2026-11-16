import '../../../../core/networking/api_result.dart';
import '../repos/account_repository.dart';

class LogoutUseCase {
  final AccountRepository _accountRepository;

  const LogoutUseCase({
    required this._accountRepository,
  });

  Future<ApiResult<void>> call() {
    return _accountRepository.logout();
  }
}

