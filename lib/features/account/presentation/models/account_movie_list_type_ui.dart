import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_strings.dart';
import '../../domain/entities/account_movie_list_type.dart';

extension AccountMovieListTypeUiX on AccountMovieListType {
  String get title => switch (this) {
    AccountMovieListType.favorites => AppStrings.favorites,
    AccountMovieListType.watchlist => AppStrings.watchlist,
  };

  String get emptyTitle => switch (this) {
    AccountMovieListType.favorites => AppStrings.noFavorites,
    AccountMovieListType.watchlist => AppStrings.noWatchlist,
  };

  String get emptySubtitle => switch (this) {
    AccountMovieListType.favorites => AppStrings.noFavoritesSubtitle,
    AccountMovieListType.watchlist => AppStrings.noWatchlistSubtitle,
  };

  String get emptySvgPath => switch (this) {
    AccountMovieListType.favorites => AppAssets.heartSvg,
    AccountMovieListType.watchlist => AppAssets.noResultsLargeSvg,
  };

  String get seeAllRoute => switch (this) {
    AccountMovieListType.favorites => Routes.favorites,
    AccountMovieListType.watchlist => Routes.watchlist,
  };
}

