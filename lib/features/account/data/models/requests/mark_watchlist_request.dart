import 'package:json_annotation/json_annotation.dart';

part 'mark_watchlist_request.g.dart';

@JsonSerializable(createFactory: false)
class MarkWatchlistRequest {
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'media_id')
  final int mediaId;
  final bool watchlist;

  const MarkWatchlistRequest({
    this.mediaType = 'movie',
    required this.mediaId,
    required this.watchlist,
  });

  Map<String, dynamic> toJson() => _$MarkWatchlistRequestToJson(this);
}

