class MovieEntity {
  final bool? isAdult;
  final String? horizontalPoster;
  final List<int>? genreIds;
  final List<String>? genreNames;

  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? tmdbRating;
  final int? tmdbVoteCount;

  const MovieEntity({
    this.isAdult,
    this.horizontalPoster,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.tmdbRating,
    this.tmdbVoteCount,
    this.genreNames,
  });

  /// The user-facing movie title, falling back to original title if empty.
  String get displayTitle => (title != null && title!.isNotEmpty)
      ? title!
      : (originalTitle ?? '');

  /// Extracts the 4-digit release year from `releaseDate` (e.g. "2024").
  String get releaseYear {
    if (releaseDate != null && releaseDate!.length >= 4) {
      return releaseDate!.substring(0, 4);
    }
    return '';
  }

  /// Uppercase original language code (e.g. "EN").
  String get formattedLanguage => originalLanguage?.toUpperCase() ?? 'EN';

  /// Safe adult movie boolean flag.
  bool get isAdultMovie => isAdult ?? false;

  /// Top 2 genre names if populated by domain use cases.
  List<String> get topTwoGenres {
    if (genreNames != null && genreNames!.isNotEmpty) {
      return genreNames!.take(2).toList();
    }
    return const [];
  }

  MovieEntity copyWith({
    bool? isAdult,
    String? horizontalPoster,
    List<int>? genreIds,
    List<String>? genreNames,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? tmdbRating,
    int? tmdbVoteCount,
  }) {
    return MovieEntity(
      isAdult: isAdult ?? this.isAdult,
      horizontalPoster: horizontalPoster ?? this.horizontalPoster,
      genreIds: genreIds ?? this.genreIds,
      genreNames: genreNames ?? this.genreNames,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      tmdbRating: tmdbRating ?? this.tmdbRating,
      tmdbVoteCount: tmdbVoteCount ?? this.tmdbVoteCount,
    );
  }
}
