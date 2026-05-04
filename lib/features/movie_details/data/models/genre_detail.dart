import 'package:json_annotation/json_annotation.dart';

part 'genre_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreDetail {
  int? id;
  String? name;

  GenreDetail({this.id, this.name});

  factory GenreDetail.fromJson(Map<String, dynamic> json) =>
      _$GenreDetailFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDetailToJson(this);
}
