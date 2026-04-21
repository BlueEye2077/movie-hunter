import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class GenresCubit extends Cubit<RequestsState<ApiResponse<dynamic>>> {
  final HomeRepository homeRepository;
  GenresCubit({required this.homeRepository})
    : super(const RequestsState.idle());

  void search(String query) async {
    emit(RequestsState.loading());
    final result = await homeRepository.search(query);
    result.when(
      success: (result) => emit(RequestsState.success(result)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
