part of 'genres_cubit.dart';

@freezed
class GenresState with _$GenresState {
  const factory GenresState.idle() = _Idle;
  const factory GenresState.loading() = _Loading;
  const factory GenresState.success(List<GenreEntity> genres) = _Success;
  const factory GenresState.error(NetworkExceptions error) = _Error;
}

