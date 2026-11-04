import 'package:json_annotation/json_annotation.dart';

part 'movie_action_status_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieActionStatusResponse {
  final bool? success;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  const MovieActionStatusResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory MovieActionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieActionStatusResponseFromJson(json);
}
