import 'package:json_annotation/json_annotation.dart';

part 'create_new_session_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateNewSessionModel {
  final bool? success;
  final String? sessionId;

  CreateNewSessionModel({this.success, this.sessionId});

  factory CreateNewSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewSessionModelToJson(this);
}
