import 'package:json_annotation/json_annotation.dart';

part 'movie_account_state_response.g.dart';

@JsonSerializable()
class MovieAccountStateResponse {
  final int id;
  final bool favorite;
  final bool watchlist;

  // TMDB "rated" can be a boolean (false) or an object if the user has rated it.
  // We'll use dynamic to safely parse it without crashing.
  final dynamic rated;

  MovieAccountStateResponse({
    required this.id,
    required this.favorite,
    required this.watchlist,
    this.rated,
  });

  factory MovieAccountStateResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieAccountStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieAccountStateResponseToJson(this);
}
