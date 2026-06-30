// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRequestTokenModel _$CreateRequestTokenModelFromJson(
  Map<String, dynamic> json,
) => CreateRequestTokenModel(
  success: json['success'] as bool?,
  expiresAt: json['expires_at'] as String?,
  requestToken: json['request_token'] as String?,
);

Map<String, dynamic> _$CreateRequestTokenModelToJson(
  CreateRequestTokenModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'expires_at': instance.expiresAt,
  'request_token': instance.requestToken,
};
