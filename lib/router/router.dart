import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_cast/model/forecast/forecast.dart';
import 'package:weather_cast/view/current_weather/bloc/current_weather_screen_bloc.dart';
import 'package:weather_cast/view/current_weather/current_weather_screen.dart';
import 'package:weather_cast/view/no_geo_permission/no_geo_permission_screen.dart';
import 'package:weather_cast/view/weather_period/bloc/weather_period_screen_bloc.dart';
import 'package:weather_cast/view/weather_period/weather_period_screen.dart';

import '../repository/shared_preference_repository.dart';
import '../view/details_weather_cast/details_weather_cast_screen.dart';
import '../view/widget/widget_condition_params/drop_down_button/bloc/drop_down_button_bloc.dart';

enum AppRoutes {
  currentWeatherScreen("/"),
  currentWeatherWithNoPermissionScreen("/no_permission"),
  weatherCastPeriodScreen("/weather_period"),
  infoWeatherScreen("/info_weather");

  final String path;

  const AppRoutes(this.path);
}

Future<bool> checkPermissionEnabled() async {
  var status = await Permission.location.status;
  if (status.isDenied || status.isRestricted) {
    if (await Permission.location.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }
  return status.isGranted;
}

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: AppRoutes.currentWeatherScreen.path,
    pageBuilder: (context, state) {
      final SharedPreferenceRepository sharedPreferenceRepository =
          GetIt.I.get<SharedPreferenceRepository>();
      return CustomTransitionPage(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CurrentWeatherScreenBloc>(
              create: (context) => CurrentWeatherScreenBloc(
                sharedPreferenceRepository: sharedPreferenceRepository,
              )..add(InitCurrentWeatherScreenEvent()),
            ),
            BlocProvider<DropDownButtonBloc>(
              create: (context) => DropDownButtonBloc(
                sharedPreferenceRepository: sharedPreferenceRepository,
              ),
            ),
            BlocProvider<WeatherPeriodScreenBloc>(
              create: (context) => WeatherPeriodScreenBloc(
                sharedPreferenceRepository: sharedPreferenceRepository,
              )..add(
                  InitWeatherPeriodEvent(),
                ),
              child: const WeatherPeriodScreen(),
            ),
          ],
          child: const CurrentWeatherScreen(),
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
    redirect: (context, state) async {
      if (await checkPermissionEnabled()) {
        return null;
      } else {
        return AppRoutes.currentWeatherWithNoPermissionScreen.path;
      }
    },
  ),
  GoRoute(
    path: AppRoutes.currentWeatherWithNoPermissionScreen.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: NoGeoPermissionScreen(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
  GoRoute(
    path: AppRoutes.weatherCastPeriodScreen.path,
    pageBuilder: (context, state) {
      final SharedPreferenceRepository sharedPreferenceRepository =
          GetIt.I.get<SharedPreferenceRepository>();
      return CustomTransitionPage(
        child: BlocProvider<WeatherPeriodScreenBloc>(
          create: (context) => WeatherPeriodScreenBloc(
            sharedPreferenceRepository: sharedPreferenceRepository,
          ),
          child: const WeatherPeriodScreen(),
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
  GoRoute(
    path: AppRoutes.infoWeatherScreen.path,
    pageBuilder: (context, state) {
      Forecast? forecast = state.extra as Forecast?;
      return CustomTransitionPage(
        child: DetailsWeatherCastScreen(
          forecast: forecast,
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
]);
