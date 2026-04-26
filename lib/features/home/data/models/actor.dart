import 'package:freezed_annotation/freezed_annotation.dart';
import 'known_for.dart';

part 'actor.g.dart';

@JsonSerializable(fieldRename: .snake)
class Actor {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });
  // fromJsom
  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
