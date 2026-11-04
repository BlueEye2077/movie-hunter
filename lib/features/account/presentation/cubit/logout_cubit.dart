import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'logout_cubit.freezed.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutCubit({required LogoutUseCase logoutUseCase})
    : _logoutUseCase = logoutUseCase,
      super(const LogoutState.idle());

  Future<void> logout() async {
    emit(const LogoutState.loading());
    final result = await _logoutUseCase();
    if (isClosed) return;
    result.when(
      success: (_) => emit(const LogoutState.success()),
      failure: (error) => emit(LogoutState.error(error)),
    );
  }
}

