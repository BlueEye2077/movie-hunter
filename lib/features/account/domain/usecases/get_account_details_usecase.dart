import '../../../../core/networking/api_result.dart';
import '../entities/account_entity.dart';
import '../repos/account_repository.dart';

class GetAccountDetailsUseCase {
  final AccountRepository _accountRepository;

  const GetAccountDetailsUseCase({
    required this._accountRepository,
  });

  Future<ApiResult<AccountEntity>> call() {
    return _accountRepository.getAccountDetails();
  }
}

