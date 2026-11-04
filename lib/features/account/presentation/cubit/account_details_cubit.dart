import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/usecases/get_account_details_usecase.dart';

part 'account_details_cubit.freezed.dart';
part 'account_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  final GetAccountDetailsUseCase _getAccountDetailsUseCase;

  AccountDetailsCubit({
    required GetAccountDetailsUseCase getAccountDetailsUseCase,
  }) : _getAccountDetailsUseCase = getAccountDetailsUseCase,
       super(const AccountDetailsState.idle());

  Future<void> getAccountDetails() async {
    emit(const AccountDetailsState.loading());
    final result = await _getAccountDetailsUseCase();
    if (isClosed) return;
    result.when(
      success: (account) => emit(AccountDetailsState.success(account)),
      failure: (error) => emit(AccountDetailsState.error(error)),
    );
  }
}

