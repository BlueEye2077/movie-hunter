import 'package:json_annotation/json_annotation.dart';

part 'create_request_token_model.g.dart';

@JsonSerializable(fieldRename: .snake)
class CreateRequestTokenModel {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  CreateRequestTokenModel({this.success, this.expiresAt, this.requestToken});

  factory CreateRequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRequestTokenModelToJson(this);
}
