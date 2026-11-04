class MovieAccountStatusEntity {
  final int movieId;
  final bool isFavorite;
  final bool isWatchlisted;

  const MovieAccountStatusEntity({
    required this.movieId,
    required this.isFavorite,
    required this.isWatchlisted,
  });

  MovieAccountStatusEntity copyWith({
    bool? isFavorite,
    bool? isWatchlisted,
  }) {
    return MovieAccountStatusEntity(
      movieId: movieId,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatchlisted: isWatchlisted ?? this.isWatchlisted,
    );
  }
}

