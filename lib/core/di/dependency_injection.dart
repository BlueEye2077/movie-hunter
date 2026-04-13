import 'package:get_it/get_it.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_service.dart';
import 'package:movie_hunter/features/home/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';

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
  // register home repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(homeApiService: getIt()),
  );
  // register home api service
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(createAndSetupDio()),
  );
}

