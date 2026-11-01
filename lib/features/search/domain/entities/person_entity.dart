class PersonEntity {
  final int id;
  final String name;
  final String? profilePath;

  const PersonEntity({
    required this.id,
    required this.name,
    this.profilePath,
  });
}

