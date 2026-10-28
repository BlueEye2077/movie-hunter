import 'package:json_annotation/json_annotation.dart';
import '../domain/models/paginated_list.dart';

part 'api_response.g.dart';

@JsonSerializable(
  fieldRename: .snake,
  genericArgumentFactories: true,
  createToJson: false,
)
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

  PaginatedList<R> toPaginatedList<R>(R Function(T item) mapper) {
    return PaginatedList<R>(
      page: page ?? 1,
      results: results?.map(mapper).toList() ?? const [],
      totalPages: totalPages ?? 1,
      totalResultsItems: totalResultsItems ?? 0,
    );
  }
}
