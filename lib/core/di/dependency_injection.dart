import 'package:get_it/get_it.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_service.dart';
import 'package:movie_hunter/features/home/logic/cubit/now_playing_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';

GetIt getIt = GetIt.instance;

void initGetIt() {
  // register up coming movies cubit
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
  // register home repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(homeApiService: getIt()),
  );
  // register home api service
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(createAndSetupDio()),
  );
}
