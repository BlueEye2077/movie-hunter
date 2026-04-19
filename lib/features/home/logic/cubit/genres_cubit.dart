import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class GenresCubit extends Cubit<RequestsState<List<Genre>>> {
  final HomeRepository homeRepository;
  GenresCubit({required this.homeRepository}) : super(const RequestsState.idle());

  void getGenres() async {
    final result = await homeRepository.getGenres();
    result.when(
      success: (genres) => emit(RequestsState.success(genres)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
