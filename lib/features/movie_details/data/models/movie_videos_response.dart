import 'package:json_annotation/json_annotation.dart';
import 'movie_video.dart';

part 'movie_videos_response.g.dart';

@JsonSerializable()
class MovieVideosResponse {
  final int? id;
  final List<MovieVideo>? results;

  MovieVideosResponse({
    this.id,
    this.results,
  });

  factory MovieVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideosResponseToJson(this);
}
