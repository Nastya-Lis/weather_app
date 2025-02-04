import 'package:get_it/get_it.dart';
import 'package:weather_cast/repository/shared_preference_repository.dart';

import '../repository/current_weather_repository/current_weather_repository.dart';
import '../repository/current_weather_repository/current_weather_repository_impl.dart';
import '../service/api/dio_service.dart';
import '../service/api/weather_api/weather_api.dart';
import '../service/api/weather_api/weather_api_impl.dart';
import '../service/geolocator/geolocator_service.dart';

class AppDependencies {
  static final AppDependencies _instance = AppDependencies._();

  factory AppDependencies() => _instance;

  AppDependencies._();

  final getIt = GetIt.I;

  Future<void> setUp() async {
    getIt.registerLazySingleton<NetworkConnector>(() => NetworkConnector(),
        instanceName: "NetworkConnector");
    getIt.registerLazySingleton<WeatherApiInterface>(() => WeatherApiImpl(),
        instanceName: "WeatherApiImpl");

    getIt.registerLazySingleton<GeoLocatorService>(
      () => GeoLocatorService(),
    );

    getIt.registerSingleton<SharedPreferenceRepository>(
      SharedPreferenceRepository(),
    );

    getIt.registerLazySingleton<CurrentWeatherRepository>(
      () =>
          CurrentWeatherRepositoryImpl(),
    );

    GetIt.I.get<SharedPreferenceRepository>().init();
  }
}
