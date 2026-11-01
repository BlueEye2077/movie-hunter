import '../../../../core/models/movie.dart';
import 'person_model.dart';

final class MovieSearchResult extends SearchResultModel {
  final Movie movie;

  const MovieSearchResult({required this.movie});
}

final class PersonSearchResult extends SearchResultModel {
  final PersonModel personModel;

  const PersonSearchResult({required this.personModel});
}

final class UnsupportedSearchResult extends SearchResultModel {
  const UnsupportedSearchResult();
}

sealed class SearchResultModel {
  const SearchResultModel();

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    switch (json["media_type"]) {
      case "movie":
        return MovieSearchResult(movie: Movie.fromJson(json));
      case "person":
        return PersonSearchResult(personModel: PersonModel.fromJson(json));
      default:
        return const UnsupportedSearchResult();
    }
  }
}
