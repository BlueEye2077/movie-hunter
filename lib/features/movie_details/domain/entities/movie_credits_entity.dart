import 'credit_entity.dart';

class MovieCreditsEntity {
  final List<CreditEntity> directors;
  final List<CreditEntity> writers;
  final List<CreditEntity> cast;
  // This field is used to store a combined list of directors, writers, and cast members for easy access and display.
  final List<CreditEntity> highlights;

  const MovieCreditsEntity({
    this.directors = const [],
    this.writers = const [],
    this.cast = const [],
    this.highlights = const [],
  });
}

