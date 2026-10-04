import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final int? id;
  final String? name;

  const Genre({required this.id, required this.name});

  // fromJson
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
