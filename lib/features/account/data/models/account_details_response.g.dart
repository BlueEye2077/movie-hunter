// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsResponse _$AccountDetailsResponseFromJson(
  Map<String, dynamic> json,
) => AccountDetailsResponse(
  avatar: json['avatar'] == null
      ? null
      : AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt(),
  languageCode: json['iso_639_1'] as String?,
  countryCode: json['iso_3166_1'] as String?,
  name: json['name'] as String?,
  includeAdult: json['include_adult'] as bool?,
  username: json['username'] as String?,
);

AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) => AvatarModel(
  gravatar: json['gravatar'] == null
      ? null
      : GravatarModel.fromJson(json['gravatar'] as Map<String, dynamic>),
  tmdb: json['tmdb'] == null
      ? null
      : TmdbAvatarModel.fromJson(json['tmdb'] as Map<String, dynamic>),
);

GravatarModel _$GravatarModelFromJson(Map<String, dynamic> json) =>
    GravatarModel(hash: json['hash'] as String?);

TmdbAvatarModel _$TmdbAvatarModelFromJson(Map<String, dynamic> json) =>
    TmdbAvatarModel(avatarPath: json['avatar_path'] as String?);

