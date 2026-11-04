import 'package:json_annotation/json_annotation.dart';

part 'mark_favorite_request.g.dart';

@JsonSerializable(createFactory: false)
class MarkFavoriteRequest {
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'media_id')
  final int mediaId;
  final bool favorite;

  const MarkFavoriteRequest({
    this.mediaType = 'movie',
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toJson() => _$MarkFavoriteRequestToJson(this);
}

