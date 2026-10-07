import 'package:json_annotation/json_annotation.dart';
import 'package:movie_hunter/features/auth/domain/entities/user_session_entity.dart';

part 'create_new_session_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CreateNewSessionResponseModel {
  final bool? success;
  final String? sessionId;

  CreateNewSessionResponseModel({this.success, this.sessionId});

  UserSessionEntity toEntity() {
    return UserSessionEntity(
      sessionId: sessionId??"",
    );
  }

  factory CreateNewSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewSessionResponseModelFromJson(json);
}
