// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
  isSuccess: json['success'] as bool?,
  statusCode: (json['status_code'] as num?)?.toInt(),
  statusMessage: json['status_message'] as String?,
);

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'success': instance.isSuccess,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
