import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_video_entity.dart';
import 'movie_video_model.dart';

part 'movie_videos_response.g.dart';

@JsonSerializable()
class MovieVideosResponse {
  final int? id;
  final List<MovieVideoModel>? results;

  const MovieVideosResponse({
    this.id,
    this.results,
  });

  factory MovieVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideosResponseToJson(this);

  List<MovieVideoEntity> toEntity() =>
      results?.map((v) => v.toEntity()).toList() ?? const [];
}
