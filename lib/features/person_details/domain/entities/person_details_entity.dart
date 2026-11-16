import '../../../../core/domain/entities/movie_entity.dart';

/// The single domain entity representing all details for a person.
class PersonDetailsEntity {
  final int id;
  final String name;
  final String biography;
  final String? knownForDepartment;
  final String? profilePath;
  final String? placeOfBirth;
  final DateTime? birthday;
  final DateTime? deathday;
  final List<MovieEntity> knownFor;
  final List<MovieEntity> allMovies;

  const PersonDetailsEntity({
    required this.id,
    required this.name,
    required this.biography,
    this.knownForDepartment,
    this.profilePath,
    this.placeOfBirth,
    this.birthday,
    this.deathday,
    this.knownFor = const [],
    this.allMovies = const [],
  });

  bool get isDeceased => deathday != null;

  /// Current age, or age at death when [isDeceased] is true.
  /// Returns null when [birthday] is unknown.
  int? get age {
    final birth = birthday;
    if (birth == null) return null;
    final endDate = deathday ?? DateTime.now();
    var calculatedAge = endDate.year - birth.year;
    if (endDate.month < birth.month ||
        (endDate.month == birth.month && endDate.day < birth.day)) {
      calculatedAge--;
    }
    return calculatedAge;
  }

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Birthday formatted as `Jan 5, 1970`, or null when [birthday] is unknown.
  String? get formattedBirthday {
    final birth = birthday;
    if (birth == null) return null;
    return '${_months[birth.month - 1]} ${birth.day}, ${birth.year}';
  }

  PersonDetailsEntity copyWith({
    int? id,
    String? name,
    String? biography,
    String? knownForDepartment,
    String? profilePath,
    String? placeOfBirth,
    DateTime? birthday,
    DateTime? deathday,
    List<MovieEntity>? knownFor,
    List<MovieEntity>? allMovies,
  }) {
    return PersonDetailsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      profilePath: profilePath ?? this.profilePath,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      birthday: birthday ?? this.birthday,
      deathday: deathday ?? this.deathday,
      knownFor: knownFor ?? this.knownFor,
      allMovies: allMovies ?? this.allMovies,
    );
  }
}
