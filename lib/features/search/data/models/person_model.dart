import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/person_entity.dart';

part 'person_model.g.dart';

@JsonSerializable(fieldRename: .snake)
class PersonModel {
  final int? id;
  final String? name;
  final String? originalName;
  final String? profilePath;

  const PersonModel({
    this.id,
    this.name,
    this.originalName,
    this.profilePath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);

  String get resolvedName {
    final trimmedName = name?.trim();
    if (trimmedName != null && trimmedName.isNotEmpty) {
      return trimmedName;
    }
    return originalName?.trim() ?? '';
  }

  bool get isValid => id != null && id! > 0 && resolvedName.isNotEmpty;

  PersonEntity toEntity() => PersonEntity(
        id: id ?? 0,
        name: resolvedName,
        profilePath: profilePath,
      );
}

