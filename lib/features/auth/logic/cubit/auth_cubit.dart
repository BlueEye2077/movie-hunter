import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/models/create_new_session_model.dart';
import '../../data/repository/auth_repository.dart';

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
