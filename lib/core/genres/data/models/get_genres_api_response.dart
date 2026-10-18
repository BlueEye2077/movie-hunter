import 'package:json_annotation/json_annotation.dart';

import '../../../models/genre.dart';

part 'get_genres_api_response.g.dart';

@JsonSerializable(createToJson: false)
class GetGenresApiResponse {
  final List<Genre>? genres;

  const GetGenresApiResponse({this.genres});

  factory GetGenresApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGenresApiResponseFromJson(json);
}
