import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  int? id;
  String? name;

  Genre({required this.id, required this.name});

  // fromJsom
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
