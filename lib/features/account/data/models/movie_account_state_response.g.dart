// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_account_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAccountStateResponse _$MovieAccountStateResponseFromJson(
  Map<String, dynamic> json,
) => MovieAccountStateResponse(
  id: (json['id'] as num).toInt(),
  favorite: json['favorite'] as bool,
  watchlist: json['watchlist'] as bool,
  rated: json['rated'],
);

Map<String, dynamic> _$MovieAccountStateResponseToJson(
  MovieAccountStateResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'favorite': instance.favorite,
  'watchlist': instance.watchlist,
  'rated': instance.rated,
};
