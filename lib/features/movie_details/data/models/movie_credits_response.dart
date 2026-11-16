import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/raw_credits_entity.dart';
import 'cast_member_model.dart';
import 'crew_member_model.dart';

part 'movie_credits_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieCreditsResponse {
  final int? id;
  final List<CastMemberModel>? cast;
  final List<CrewMemberModel>? crew;

  const MovieCreditsResponse({this.id, this.cast, this.crew});

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsResponseToJson(this);

  RawCreditsEntity toEntity() => RawCreditsEntity(
        cast: cast?.map((c) => c.toEntity()).toList() ?? const [],
        crew: crew?.map((c) => c.toEntity()).toList() ?? const [],
      );
}
