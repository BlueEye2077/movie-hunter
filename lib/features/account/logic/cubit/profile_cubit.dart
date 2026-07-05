import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/models/account_details_model.dart';
import '../../data/repository/profile_repository.dart';

class ProfileCubit extends Cubit<RequestsState<AccountDetailsModel>> {
  final ProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository})
    : super(RequestsState.idle());

  Future<void> getAccountDetails() async {
    emit(RequestsState.loading());
    final result = await profileRepository.getAccountDetails();
    result.when(
      success: (data) => emit(RequestsState.success(data)),
      failure: (failure) => emit(RequestsState.error(failure)),
    );
  }
}
