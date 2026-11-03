import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_video_entity.dart';

part 'movie_video_model.g.dart';

@JsonSerializable()
class MovieVideoModel {
  final String? id;
  final String? name;
  final String? key;
  final String? site;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;

  const MovieVideoModel({
    this.id,
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
    this.publishedAt,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoModelToJson(this);

  MovieVideoEntity toEntity() {
    final videoSite = switch (site?.toLowerCase()) {
      'youtube' => VideoSite.youTube,
      _ => VideoSite.other,
    };

    final videoType = switch (type?.toLowerCase()) {
      'trailer' => VideoType.trailer,
      'teaser' => VideoType.teaser,
      'clip' => VideoType.clip,
      'featurette' => VideoType.featurette,
      'behind the scenes' => VideoType.behindTheScenes,
      _ => VideoType.other,
    };

    return MovieVideoEntity(
      id: id ?? '',
      name: name ?? '',
      key: key ?? '',
      site: videoSite,
      type: videoType,
      isOfficial: official ?? false,
    );
  }
}

