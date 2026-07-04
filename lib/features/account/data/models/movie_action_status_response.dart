import 'package:json_annotation/json_annotation.dart';

part 'movie_action_status_response.g.dart';

@JsonSerializable()
class MovieActionStatusResponse {
  final bool success;
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'status_message')
  final String statusMessage;

  MovieActionStatusResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory MovieActionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieActionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieActionStatusResponseToJson(this);
}
