import 'package:get_it/get_it.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_service.dart';
import 'package:movie_hunter/features/home/logic/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(homeRepository: getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(homeApiService: getIt()),
  );
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(createAndSetupDio()),
  );
}
