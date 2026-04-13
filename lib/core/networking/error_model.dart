import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(fieldRename: .snake)
class ErrorModel {
  @JsonKey(name: "success")
  bool? isSuccess;
  int? statusCode;
  String? statusMessage;

  ErrorModel({this.isSuccess, this.statusCode, this.statusMessage});

  // fromJsom
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
