part of 'similar_movies_cubit.dart';

@freezed
class SimilarMoviesState with _$SimilarMoviesState {
  const factory SimilarMoviesState.idle() = _Idle;
  const factory SimilarMoviesState.loading() = _Loading;
  const factory SimilarMoviesState.success(List<MovieEntity> movies) = _Success;
  const factory SimilarMoviesState.error(NetworkExceptions error) = _Error;
}

