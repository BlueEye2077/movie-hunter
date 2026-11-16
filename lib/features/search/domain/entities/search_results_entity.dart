import '../../../../core/domain/entities/movie_entity.dart';
import 'person_entity.dart';

class SearchResultsEntity {
  final List<MovieEntity> movies;
  final List<PersonEntity> people;

  const SearchResultsEntity({
    this.movies = const [],
    this.people = const [],
  });

  bool get isEmpty => movies.isEmpty && people.isEmpty;
  bool get isNotEmpty => !isEmpty;
}

