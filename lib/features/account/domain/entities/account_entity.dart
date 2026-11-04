class AccountEntity {
  final int id;
  final String name;
  final String username;
  final String? avatarPath;

  const AccountEntity({
    required this.id,
    required this.name,
    required this.username,
    this.avatarPath,
  });

  String get displayName => name.isNotEmpty ? name : username;
}

