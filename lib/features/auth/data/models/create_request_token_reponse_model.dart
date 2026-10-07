import 'package:json_annotation/json_annotation.dart';

part 'create_request_token_reponse_model.g.dart';

@JsonSerializable(fieldRename: .snake, createToJson: false)
class CreateRequestTokenResponseModel {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  CreateRequestTokenResponseModel({this.success, this.expiresAt, this.requestToken});

  factory CreateRequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestTokenResponseModelFromJson(json);

}
