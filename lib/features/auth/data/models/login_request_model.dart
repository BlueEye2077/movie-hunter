import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(fieldRename: .snake, createFactory: false)
class LoginRequestModel {
  final String? username;
  final String? password;
  final String? requestToken;

  const LoginRequestModel({this.username, this.password, this.requestToken});

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
