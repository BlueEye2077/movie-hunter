class CreditEntity {
  final int id;
  final String name;
  final String role;
  final String? profilePath;

  const CreditEntity({
    required this.id,
    required this.name,
    required this.role,
    this.profilePath,
  });
}

