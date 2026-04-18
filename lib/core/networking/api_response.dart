import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(fieldRename: .snake, genericArgumentFactories: true)
class ApiResponse<T> {
  int? page;
  @JsonKey(name: "results")
  List<T>? results;
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResultsItems;

  ApiResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResultsItems,
  });

  // fromJson
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  // toJson
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
