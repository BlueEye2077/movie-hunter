import 'package:get_it/get_it.dart';

import '../../features/account/data/repository/profile_repository.dart';
import '../../features/account/data/web_services/profile_api_services.dart';
import '../../features/account/logic/cubit/favorite_movies_cubit.dart';
import '../../features/account/logic/cubit/favourites_cubit.dart';
import '../../features/account/logic/cubit/profile_cubit.dart';
import '../../features/account/logic/cubit/watchlist_cubit.dart';
import '../../features/account/logic/cubit/watchlist_movies_cubit.dart';
import '../../features/all_movies/logic/cubit/all_movies_cubit.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/data/web_services/auth_api_services.dart';
import '../../features/auth/logic/cubit/auth_cubit.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/home/data/web_services/home_api_service.dart';
import '../../features/home/logic/cubit/genres_cubit.dart';
import '../../features/home/logic/cubit/now_playing_movies_cubit.dart';
import '../../features/home/logic/cubit/popular_movies_cubit.dart';
import '../../features/home/logic/cubit/top_rated_movies_cubit.dart';
import '../../features/home/logic/cubit/upcoming_movies_cubit.dart';
import '../../features/movie_details/data/repository/movie_details_repository.dart';
import '../../features/movie_details/data/web_services/details_api_service.dart';
import '../../features/movie_details/logic/cubit/movie_details_cubit.dart';
import '../../features/movie_details/logic/cubit/movie_trailer_cubit.dart';
import '../../features/movie_details/logic/cubit/similar_movies_cubit.dart';
import '../../features/search/data/repository/search_repository.dart';
import '../../features/search/data/web_services/search_api_service.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../networking/dio_factory.dart';

GetIt getIt = GetIt.instance;

void initGetIt() {
  // ── Shared ──
  final dio = createAndSetupDio();

  // ── Home Feature ──
  // register home api service
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // register home repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(homeApiService: getIt()),
  );
  // register upcoming movies cubit
  getIt.registerLazySingleton<UpComingMoviesCubit>(
    () => UpComingMoviesCubit(homeRepository: getIt()),
  );
  // register popular movies cubit
  getIt.registerLazySingleton<PopularMoviesCubit>(
    () => PopularMoviesCubit(homeRepository: getIt()),
  );
  // register top rated movies cubit
  getIt.registerLazySingleton<TopRatedMoviesCubit>(
    () => TopRatedMoviesCubit(homeRepository: getIt()),
  );
  // register now playing movies cubit
  getIt.registerLazySingleton<NowPlayingMoviesCubit>(
    () => NowPlayingMoviesCubit(homeRepository: getIt()),
  );
  // register genres cubit
  getIt.registerLazySingleton<GenresCubit>(
    () => GenresCubit(homeRepository: getIt()),
  );

  // ── Search Feature ──
  // register search api service
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  // register search repository
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepository(searchApiService: getIt()),
  );
  // register search cubit (factory — fresh instance per search session)
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(searchRepository: getIt()),
  );

  // ── Movie Details Feature ──
  // register details api service
  getIt.registerLazySingleton<DetailsApiService>(() => DetailsApiService(dio));
  // register movie details repository
  getIt.registerLazySingleton<MovieDetailsRepository>(
    () => MovieDetailsRepository(detailsApiService: getIt()),
  );
  // register movie details cubit
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(movieDetailsRepository: getIt()),
  );
  // register movie trailer cubit
  getIt.registerFactory<MovieTrailerCubit>(
    () => MovieTrailerCubit(movieDetailsRepository: getIt()),
  );
  // register similar movies cubit
  getIt.registerFactory<SimilarMoviesCubit>(
    () => SimilarMoviesCubit(movieDetailsRepository: getIt()),
  );

  // ── All Movies Feature ──
  // register the all movies cubit
  getIt.registerFactory<AllMoviesCubit>(
    () => AllMoviesCubit(homeRepository: getIt(), profileRepository: getIt()),
  );

  // ── Auth Feature ──
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(authApiService: getIt()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepository: getIt()));

  // ── Account Feature ──
  getIt.registerLazySingleton<ProfileApiServices>(
    () => ProfileApiServices(dio),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(profileApiService: getIt()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(profileRepository: getIt()),
  );
  getIt.registerFactory<FavoriteMoviesCubit>(
    () => FavoriteMoviesCubit(profileRepository: getIt()),
  );
  getIt.registerFactory<WatchlistMoviesCubit>(
    () => WatchlistMoviesCubit(profileRepository: getIt()),
  );

  // ── Favourites Feature ──
  getIt.registerFactory<FavouritesCubit>(
    () => FavouritesCubit(profileRepository: getIt()),
  );

  // ── Watchlist Feature ──
  getIt.registerFactory<WatchlistCubit>(
    () => WatchlistCubit(profileRepository: getIt()),
  );
}
