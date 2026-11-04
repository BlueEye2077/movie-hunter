import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/account_entity.dart';

part 'account_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AccountDetailsResponse {
  final AvatarModel? avatar;
  final int? id;
  @JsonKey(name: 'iso_639_1')
  final String? languageCode;
  @JsonKey(name: 'iso_3166_1')
  final String? countryCode;
  final String? name;
  final bool? includeAdult;
  final String? username;

  const AccountDetailsResponse({
    this.avatar,
    this.id,
    this.languageCode,
    this.countryCode,
    this.name,
    this.includeAdult,
    this.username,
  });

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsResponseFromJson(json);

  AccountEntity toEntity() {
    return AccountEntity(
      id: id ?? 0,
      name: name ?? '',
      username: username ?? '',
      avatarPath: avatar?.tmdb?.avatarPath,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class AvatarModel {
  final GravatarModel? gravatar;
  final TmdbAvatarModel? tmdb;

  const AvatarModel({this.gravatar, this.tmdb});

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class GravatarModel {
  final String? hash;

  const GravatarModel({this.hash});

  factory GravatarModel.fromJson(Map<String, dynamic> json) =>
      _$GravatarModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class TmdbAvatarModel {
  final String? avatarPath;

  const TmdbAvatarModel({this.avatarPath});

  factory TmdbAvatarModel.fromJson(Map<String, dynamic> json) =>
      _$TmdbAvatarModelFromJson(json);
}

