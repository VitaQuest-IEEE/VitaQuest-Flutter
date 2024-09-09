import 'package:get_it/get_it.dart';
import 'package:vita_quest/core/helpers/cache_helper.dart';

import '../database/database_provider.dart';
import '../database/database_service.dart';
import '../networking/api_services.dart';
import '../helpers/navigation_helper.dart';
import '../networking/dio_handler.dart';

final getIt = GetIt.instance;

Future<void> gitItInit() async {
  //* ----------- app -----------
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<ApiServices>(() => DioHandler());
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerLazySingleton<DataBaseProvider>(() => DataBaseService());
}
