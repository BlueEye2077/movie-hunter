// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_genres_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenresApiResponse _$GetGenresApiResponseFromJson(
  Map<String, dynamic> json,
) => GetGenresApiResponse(
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
);
