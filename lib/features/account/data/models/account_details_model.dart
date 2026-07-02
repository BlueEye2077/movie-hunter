import 'package:json_annotation/json_annotation.dart';

part 'account_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccountDetailsModel {
  final Avatar? avatar;
  final int? id;
  @JsonKey(name: 'iso_639_1')
  final String? languageCode;
  @JsonKey(name: 'iso_3166_1')
  final String? countryCode;
  final String? name;
  final bool? includeAdult;
  final String? username;

  AccountDetailsModel({
    this.avatar,
    this.id,
    this.languageCode,
    this.countryCode,
    this.name,
    this.includeAdult,
    this.username,
  });

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Avatar {
  final Gravatar? gravatar;
  final TmdbAvatar? tmdb;

  Avatar({this.gravatar, this.tmdb});

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Gravatar {
  final String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);

  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TmdbAvatar {
  final String? avatarPath;

  TmdbAvatar({this.avatarPath});

  factory TmdbAvatar.fromJson(Map<String, dynamic> json) =>
      _$TmdbAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$TmdbAvatarToJson(this);
}
