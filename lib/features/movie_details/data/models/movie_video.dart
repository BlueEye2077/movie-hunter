import 'package:json_annotation/json_annotation.dart';

part 'movie_video.g.dart';

@JsonSerializable()
class MovieVideo {
  final String? id;
  final String? name;
  final String? key;
  final String? site;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;

  MovieVideo({
    this.id,
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
    this.publishedAt,
  });

  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoToJson(this);
}
