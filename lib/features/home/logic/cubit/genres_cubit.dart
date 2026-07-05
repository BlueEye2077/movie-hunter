import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/models/genre.dart';
import '../../data/repository/home_repository.dart';

class GenresCubit extends Cubit<RequestsState<List<Genre>>> {
  final HomeRepository homeRepository;
  GenresCubit({required this.homeRepository})
    : super(const RequestsState.idle());

  void getGenres() async {
    final result = await homeRepository.getGenres();
    if (isClosed) return;
    result.when(
      success: (genres) => emit(RequestsState.success(genres)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
