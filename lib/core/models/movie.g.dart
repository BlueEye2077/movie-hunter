// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  isAdult: json['adult'] as bool?,
  horizontalPoster: json['backdrop_path'] as String?,
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  id: (json['id'] as num?)?.toInt(),
  originalLanguage: json['original_language'] as String?,
  originalTitle: json['original_title'] as String?,
  overview: json['overview'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  posterPath: json['poster_path'] as String?,
  releaseDate: json['release_date'] as String?,
  title: json['title'] as String?,
  video: json['video'] as bool?,
  tmdbRating: (json['vote_average'] as num?)?.toDouble(),
  tmdbVoteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'adult': instance.isAdult,
  'backdrop_path': instance.horizontalPoster,
  'genre_ids': instance.genreIds,
  'id': instance.id,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'release_date': instance.releaseDate,
  'title': instance.title,
  'video': instance.video,
  'vote_average': instance.tmdbRating,
  'vote_count': instance.tmdbVoteCount,
};
