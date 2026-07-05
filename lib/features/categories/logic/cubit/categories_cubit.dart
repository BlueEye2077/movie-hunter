import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';

import '../../../home/data/models/genre.dart';
import '../../../home/data/repository/home_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepository _homeRepository;
  bool _isFetched = false;

  CategoriesCubit(this._homeRepository) : super(const CategoriesState.idle());

  Future<void> fetchGenreImages(List<Genre> genres) async {
    if (_isFetched || genres.isEmpty) return;

    emit(const CategoriesState.loading());

    final Map<int, String> genreImages = {};
    bool hasError = false;

    // Fetch images for all genres in parallel
    final futures = genres.map((genre) async {
      final result = await _homeRepository.getMoviesByGenre(genreId: genre.id ?? 0, page: 1);
      
      if (isClosed) return;

      result.when(
        success: (response) {
          if (response.results != null && response.results!.isNotEmpty) {
            // Find the first movie with a valid backdrop or poster
            final movie = response.results!.firstWhere(
              (m) => m.horizontalPoster != null || m.posterPath != null,
              orElse: () => response.results!.first,
            );
            
            genreImages[genre.id ?? 0] = movie.horizontalPoster ?? movie.posterPath ?? '';
          }
        },
        failure: (error) {
          hasError = true;
        },
      );
    });

    await Future.wait(futures);

    if (isClosed) return;

    if (!hasError || genreImages.isNotEmpty) {
      _isFetched = true;
      emit(CategoriesState.success(genreImages));
    } else {
      emit(const CategoriesState.error(
        NetworkExceptions.defaultError('Failed to fetch images'), 
      ));
    }
  }
}
