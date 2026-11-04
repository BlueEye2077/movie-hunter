import 'package:get_it/get_it.dart';

import '../../features/account/data/repos/account_repository_impl.dart';
import '../../features/account/data/web_services/account_api_service.dart';
import '../../features/account/domain/repos/account_repository.dart';
import '../../features/account/domain/usecases/get_account_details_usecase.dart';
import '../../features/account/domain/usecases/get_account_movies_usecase.dart';
import '../../features/account/domain/usecases/get_movie_account_status_usecase.dart';
import '../../features/account/domain/usecases/logout_usecase.dart';
import '../../features/account/domain/usecases/update_movie_account_list_usecase.dart';
import '../../features/account/domain/usecases/watch_account_movie_changes_usecase.dart';
import '../../features/account/presentation/cubit/account_details_cubit.dart';
import '../../features/account/presentation/cubit/account_movies_cubit.dart';
import '../../features/account/presentation/cubit/logout_cubit.dart';
import '../../features/account/presentation/cubit/movie_account_status_cubit.dart';
import '../../features/all_movies/domain/usecases/get_movies_by_genre_usecase.dart';
import '../../features/all_movies/domain/usecases/get_movies_page_usecase.dart';
import '../../features/all_movies/presentation/cubit/all_movies_cubit.dart';
import '../../features/auth/data/repos/auth_repository_impl.dart';
import '../../features/auth/data/web_services/auth_api_services.dart';
import '../../features/auth/domain/repos/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/categories/data/repos/categories_repository_impl.dart';
import '../../features/categories/data/web_services/categories_api_service.dart';
import '../../features/categories/domain/repos/categories_repository.dart';
import '../../features/categories/domain/usecases/get_categories_usecase.dart';
import '../../features/categories/presentation/cubit/categories_cubit.dart';
import '../../features/home/data/repos/home_repository_impl.dart';
import '../../features/home/data/web_services/home_api_service.dart';
import '../../features/home/domain/repos/home_repository.dart';
import '../../features/home/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../features/home/domain/usecases/get_popular_movies_usecase.dart';
import '../../features/home/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../features/home/domain/usecases/get_upcoming_movies_usecase.dart';
import '../../features/home/presentation/cubit/now_playing_movies_cubit.dart';
import '../../features/home/presentation/cubit/popular_movies_cubit.dart';
import '../../features/home/presentation/cubit/top_rated_movies_cubit.dart';
import '../../features/home/presentation/cubit/upcoming_movies_cubit.dart';
import '../../features/movie_details/data/repos/movie_details_repository_impl.dart';
import '../../features/movie_details/data/web_services/details_api_service.dart';
import '../../features/movie_details/domain/repos/movie_details_repository.dart';
import '../../features/movie_details/domain/usecases/get_movie_credits_usecase.dart';
import '../../features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import '../../features/movie_details/domain/usecases/get_movie_trailer_usecase.dart';
import '../../features/movie_details/domain/usecases/get_similar_movies_usecase.dart';
import '../../features/movie_details/presentation/cubit/movie_credits_cubit.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../../features/movie_details/presentation/cubit/movie_trailer_cubit.dart';
import '../../features/movie_details/presentation/cubit/similar_movies_cubit.dart';
import '../../features/person_details/data/repos/person_details_repository_impl.dart';
import '../../features/person_details/data/web_services/person_api_service.dart';
import '../../features/person_details/domain/repos/person_details_repository.dart';
import '../../features/person_details/domain/usecases/get_person_details_usecase.dart';
import '../../features/person_details/presentation/cubit/person_details_cubit.dart';
import '../../features/search/data/repos/search_repository_impl.dart';
import '../../features/search/data/web_services/search_api_service.dart';
import '../../features/search/domain/repos/search_repository.dart';
import '../../features/search/domain/usecases/search_usecase.dart';
import '../../features/search/presentation/cubit/search_cubit.dart';
import '../genres/cubit/genres_cubit.dart';
import '../genres/data/repos/genres_repository_impl.dart';
import '../genres/data/web_services/genres_api_services.dart';
import '../genres/domain/repos/genres_repository.dart';
import '../genres/domain/usecases/get_genres_usecase.dart';
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
    () => HomeRepositoryImpl(homeApiService: getIt()),
  );

  // register home use cases
  getIt.registerLazySingleton<GetUpcomingMoviesUseCase>(
    () => GetUpcomingMoviesUseCase(
      homeRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(
      homeRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
    () => GetTopRatedMoviesUseCase(
      homeRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
    () => GetNowPlayingMoviesUseCase(
      homeRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  // ── Genres ──
  getIt.registerLazySingleton<GenresApiServices>(() => GenresApiServices(dio));
  getIt.registerLazySingleton<GenresRepository>(
    () => GenresRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetGenresUseCase>(
    () => GetGenresUseCase(genresRepository: getIt()),
  );

  // register movie cubits
  getIt.registerFactory<UpcomingMoviesCubit>(
    () => UpcomingMoviesCubit(getUpcomingMoviesUseCase: getIt()),
  );
  getIt.registerFactory<PopularMoviesCubit>(
    () => PopularMoviesCubit(getPopularMoviesUseCase: getIt()),
  );
  getIt.registerFactory<TopRatedMoviesCubit>(
    () => TopRatedMoviesCubit(getTopRatedMoviesUseCase: getIt()),
  );
  getIt.registerFactory<NowPlayingMoviesCubit>(
    () => NowPlayingMoviesCubit(getNowPlayingMoviesUseCase: getIt()),
  );
  // register genres cubit
  getIt.registerFactory<GenresCubit>(
    () => GenresCubit(getGenresUseCase: getIt()),
  );

  // ── Categories Feature ──
  getIt.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(dio),
  );
  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(categoriesApiService: getIt()),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(
      categoriesRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: getIt()),
  );

  // ── Search Feature ──
  // register search api service
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  // register search repository
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchApiService: getIt()),
  );
  getIt.registerLazySingleton<SearchUseCase>(
    () => SearchUseCase(
      searchRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  // register search cubit (factory — fresh instance per search session)
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(searchUseCase: getIt()),
  );

  // ── Movie Details Feature ──
  getIt.registerLazySingleton<DetailsApiService>(() => DetailsApiService(dio));
  getIt.registerLazySingleton<MovieDetailsRepository>(
    () => MovieDetailsRepositoryImpl(detailsApiService: getIt()),
  );
  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(movieDetailsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetMovieCreditsUseCase>(
    () => GetMovieCreditsUseCase(movieDetailsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetMovieTrailerUseCase>(
    () => GetMovieTrailerUseCase(movieDetailsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetSimilarMoviesUseCase>(
    () => GetSimilarMoviesUseCase(
      movieDetailsRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(getMovieDetailsUseCase: getIt()),
  );
  getIt.registerFactory<MovieCreditsCubit>(
    () => MovieCreditsCubit(getMovieCreditsUseCase: getIt()),
  );
  getIt.registerFactory<MovieTrailerCubit>(
    () => MovieTrailerCubit(getMovieTrailerUseCase: getIt()),
  );
  getIt.registerFactory<SimilarMoviesCubit>(
    () => SimilarMoviesCubit(getSimilarMoviesUseCase: getIt()),
  );

  // ── Person Details Feature ──
  // register person api service
  getIt.registerLazySingleton<PersonApiService>(() => PersonApiService(dio));
  // register person repository
  getIt.registerLazySingleton<PersonDetailsRepository>(
    () => PersonDetailsRepositoryImpl(personApiService: getIt()),
  );
  // register get person details use case
  getIt.registerLazySingleton<GetPersonDetailsUseCase>(
    () => GetPersonDetailsUseCase(
      personDetailsRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  // register person details cubit
  getIt.registerFactory<PersonDetailsCubit>(
    () => PersonDetailsCubit(getPersonDetailsUseCase: getIt()),
  );

  // ── All Movies Feature ──
  getIt.registerLazySingleton<GetMoviesByGenreUseCase>(
    () => GetMoviesByGenreUseCase(
      categoriesRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetMoviesPageUseCase>(
    () => GetMoviesPageUseCase(
      getUpcomingMoviesUseCase: getIt(),
      getNowPlayingMoviesUseCase: getIt(),
      getPopularMoviesUseCase: getIt(),
      getTopRatedMoviesUseCase: getIt(),
      getMoviesByGenreUseCase: getIt(),
    ),
  );
  getIt.registerFactory<AllMoviesCubit>(
    () => AllMoviesCubit(getMoviesPageUseCase: getIt()),
  );

  // ── Auth Feature ──
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authApiService: getIt()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  // ── Account Feature ──
  getIt.registerLazySingleton<AccountApiService>(
    () => AccountApiService(dio),
  );
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(accountApiService: getIt()),
  );
  getIt.registerLazySingleton<GetAccountDetailsUseCase>(
    () => GetAccountDetailsUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAccountMoviesUseCase>(
    () => GetAccountMoviesUseCase(
      accountRepository: getIt(),
      genresRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetMovieAccountStatusUseCase>(
    () => GetMovieAccountStatusUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateMovieAccountListUseCase>(
    () => UpdateMovieAccountListUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<WatchAccountMovieChangesUseCase>(
    () => WatchAccountMovieChangesUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(accountRepository: getIt()),
  );

  getIt.registerFactory<AccountDetailsCubit>(
    () => AccountDetailsCubit(getAccountDetailsUseCase: getIt()),
  );
  getIt.registerFactory<FavoriteMoviesCubit>(
    () => FavoriteMoviesCubit(
      getAccountMoviesUseCase: getIt(),
      watchAccountMovieChangesUseCase: getIt(),
    ),
  );
  getIt.registerFactory<WatchlistMoviesCubit>(
    () => WatchlistMoviesCubit(
      getAccountMoviesUseCase: getIt(),
      watchAccountMovieChangesUseCase: getIt(),
    ),
  );
  getIt.registerFactory<MovieAccountStatusCubit>(
    () => MovieAccountStatusCubit(
      getMovieAccountStatusUseCase: getIt(),
      updateMovieAccountListUseCase: getIt(),
    ),
  );
  getIt.registerFactory<LogoutCubit>(
    () => LogoutCubit(logoutUseCase: getIt()),
  );
}
