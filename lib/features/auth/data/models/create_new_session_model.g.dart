// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewSessionModel _$CreateNewSessionModelFromJson(
  Map<String, dynamic> json,
) => CreateNewSessionModel(
  success: json['success'] as bool?,
  sessionId: json['session_id'] as String?,
);

Map<String, dynamic> _$CreateNewSessionModelToJson(
  CreateNewSessionModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'session_id': instance.sessionId,
};
