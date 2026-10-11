import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/user_session_entity.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthCubit(this._loginUseCase) : super(const AuthState.idle());

  Future<void> login(String username, String password) async {
    emit(const AuthState.loading());
    final ApiResult<UserSessionEntity> result = await _loginUseCase(
      username.trim(),
      password,
    );
    // Safe guard against the user navigating away from the login screen before the login request completes
    if (isClosed) return;
    result.when(
      success: (data) => emit(AuthState.success(data)),
      failure: (networkExceptions) => emit(AuthState.error(networkExceptions)),
    );
  }
}
