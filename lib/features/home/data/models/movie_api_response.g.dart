// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieApiResponse _$MovieApiResponseFromJson(Map<String, dynamic> json) =>
    MovieApiResponse(
      page: (json['page'] as num?)?.toInt(),
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalMovies: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieApiResponseToJson(MovieApiResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalMovies,
    };
