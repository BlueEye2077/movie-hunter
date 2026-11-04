import 'package:json_annotation/json_annotation.dart';

part 'delete_session_request.g.dart';

@JsonSerializable(createFactory: false)
class DeleteSessionRequest {
  @JsonKey(name: 'session_id')
  final String sessionId;

  const DeleteSessionRequest({required this.sessionId});

  Map<String, dynamic> toJson() => _$DeleteSessionRequestToJson(this);
}

