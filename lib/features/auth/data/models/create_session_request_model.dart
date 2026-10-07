import 'package:json_annotation/json_annotation.dart';

part 'create_session_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class CreateSessionRequestModel {
  final String requestToken;

  const CreateSessionRequestModel({required this.requestToken});

  Map<String, dynamic> toJson() => _$CreateSessionRequestModelToJson(this);
}

