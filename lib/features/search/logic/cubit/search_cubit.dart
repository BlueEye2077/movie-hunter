import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/logic/cubit/requests_state.dart';
import '../../data/repository/search_repository.dart';

class SearchCubit extends Cubit<RequestsState<ApiResponse<dynamic>>> {
  final SearchRepository searchRepository;
  SearchCubit({required this.searchRepository})
    : super(const RequestsState.idle());

  void search(String query) async {
    emit(RequestsState.loading());
    final result = await searchRepository.search(query);
    result.when(
      success: (result) => emit(RequestsState.success(result)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
