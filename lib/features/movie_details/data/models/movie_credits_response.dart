import 'package:json_annotation/json_annotation.dart';

import 'cast_member.dart';
import 'crew_member.dart';

part 'movie_credits_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieCreditsResponse {
  int? id;
  List<CastMember>? cast;
  List<CrewMember>? crew;

  MovieCreditsResponse({this.id, this.cast, this.crew});

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsResponseToJson(this);
}
