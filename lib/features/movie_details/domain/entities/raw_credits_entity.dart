class CastMemberEntity {
  final int id;
  final String name;
  final String character;
  final String? profilePath;
  final int? order;

  const CastMemberEntity({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
    this.order,
  });
}

class CrewMemberEntity {
  final int id;
  final String name;
  final String job;
  final String? department;
  final String? profilePath;

  const CrewMemberEntity({
    required this.id,
    required this.name,
    required this.job,
    this.department,
    this.profilePath,
  });
}

class RawCreditsEntity {
  final List<CastMemberEntity> cast;
  final List<CrewMemberEntity> crew;

  const RawCreditsEntity({
    this.cast = const [],
    this.crew = const [],
  });
}

