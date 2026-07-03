import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/movie.dart';
import '../../data/repository/profile_repository.dart';

class FavoriteMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  final ProfileRepository profileRepository;

  FavoriteMoviesCubit({required this.profileRepository})
      : super(const RequestsState.idle());

  Future<void> getFavoriteMovies({int page = 1}) async {
    emit(const RequestsState.loading());
    final result = await profileRepository.getFavoriteMovies(page);
    result.when(
      success: (data) => emit(RequestsState.success(data)),
      failure: (failure) => emit(RequestsState.error(failure)),
    );
  }
}
