import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/genre.dart';
import '../../domain/entities/movie_details_entity.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final int? runtime;
  final double? voteAverage;
  final int? voteCount;
  final List<Genre>? genres;

  const MovieDetailsResponse({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.runtime,
    this.voteAverage,
    this.voteCount,
    this.genres,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      id: id ?? 0,
      title: title ?? '',
      overview: overview ?? '',
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      year: _extractYear(releaseDate),
      runtime: runtime,
      formattedRuntime: _formatRuntime(runtime),
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      genres: genres?.map((g) => g.toEntity()).toList() ?? const [],
    );
  }

  static String? _extractYear(String? date) {
    if (date == null || date.isEmpty) return null;
    final parsed = DateTime.tryParse(date);
    if (parsed != null) return parsed.year.toString();
    if (date.length >= 4) return date.substring(0, 4);
    return null;
  }

  static String? _formatRuntime(int? minutes) {
    if (minutes == null || minutes <= 0) return null;
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return hours > 0 ? '${hours}h ${mins}m' : '${mins}m';
  }
}
