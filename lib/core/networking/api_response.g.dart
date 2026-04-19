// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponse<T>(
  page: (json['page'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
  totalResultsItems: (json['total_results'] as num?)?.toInt(),
);

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results?.map(toJsonT).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResultsItems,
};
