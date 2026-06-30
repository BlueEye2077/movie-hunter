import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/auth/data/models/create_new_session_model.dart';

import 'package:movie_hunter/features/auth/data/repository/auth_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class AuthCubit extends Cubit<RequestsState<CreateNewSessionModel>> {
  AuthCubit({required this.authRepository}) : super(RequestsState.idle());

  final AuthRepository authRepository;

  void login(String username, String password) async {
    emit(RequestsState.loading());
    ApiResult<CreateNewSessionModel> response = await authRepository
        .performFullLogin(username, password);
    response.when(
      success: (data) => emit(RequestsState.success(data)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
