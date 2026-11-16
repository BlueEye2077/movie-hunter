import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_account_status_entity.dart';

part 'movie_account_state_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieAccountStateResponse {
  final int id;
  final bool favorite;
  final bool watchlist;

  const MovieAccountStateResponse({
    required this.id,
    required this.favorite,
    required this.watchlist,
  });

  factory MovieAccountStateResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieAccountStateResponseFromJson(json);

  MovieAccountStatusEntity toEntity() {
    return MovieAccountStatusEntity(
      movieId: id,
      isFavorite: favorite,
      isWatchlisted: watchlist,
    );
  }
}
