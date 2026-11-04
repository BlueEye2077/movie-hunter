import 'account_movie_list_type.dart';

class AccountMovieChange {
  final int movieId;
  final AccountMovieListType listType;
  final bool isAdded;

  const AccountMovieChange({
    required this.movieId,
    required this.listType,
    required this.isAdded,
  });
}

