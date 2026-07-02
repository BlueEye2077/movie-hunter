// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsModel _$AccountDetailsModelFromJson(Map<String, dynamic> json) =>
    AccountDetailsModel(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      languageCode: json['iso_639_1'] as String?,
      countryCode: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AccountDetailsModelToJson(
  AccountDetailsModel instance,
) => <String, dynamic>{
  'avatar': instance.avatar,
  'id': instance.id,
  'iso_639_1': instance.languageCode,
  'iso_3166_1': instance.countryCode,
  'name': instance.name,
  'include_adult': instance.includeAdult,
  'username': instance.username,
};

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
  gravatar: json['gravatar'] == null
      ? null
      : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
  tmdb: json['tmdb'] == null
      ? null
      : TmdbAvatar.fromJson(json['tmdb'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
  'gravatar': instance.gravatar,
  'tmdb': instance.tmdb,
};

Gravatar _$GravatarFromJson(Map<String, dynamic> json) =>
    Gravatar(hash: json['hash'] as String?);

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
  'hash': instance.hash,
};

TmdbAvatar _$TmdbAvatarFromJson(Map<String, dynamic> json) =>
    TmdbAvatar(avatarPath: json['avatar_path'] as String?);

Map<String, dynamic> _$TmdbAvatarToJson(TmdbAvatar instance) =>
    <String, dynamic>{'avatar_path': instance.avatarPath};
