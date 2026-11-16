// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_action_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieActionStatusResponse _$MovieActionStatusResponseFromJson(
  Map<String, dynamic> json,
) => MovieActionStatusResponse(
  success: json['success'] as bool?,
  statusCode: (json['status_code'] as num?)?.toInt(),
  statusMessage: json['status_message'] as String?,
);
