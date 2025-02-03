import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:weather_cast/model/forecast/forecast.dart';

import '../../../repository/current_weather_repository/current_weather_repository.dart';

part 'weather_period_screen_event.dart';

part 'weather_period_screen_state.dart';

class WeatherPeriodScreenBloc
    extends Bloc<WeatherPeriodScreenEvent, WeatherPeriodScreenState> {
  final CurrentWeatherRepository _currentWeatherRepository = GetIt.I
      .get<CurrentWeatherRepository>(
          /*instanceName: "CurrentWeatherRepositoryImpl"*/);

  WeatherPeriodScreenBloc()
      : super(const WeatherPeriodScreenState(
          forecast: null,
        )) {
    on<InitWeatherPeriodEvent>(_initWeatherPeriod);
  }

  FutureOr<void> _initWeatherPeriod(InitWeatherPeriodEvent event,
      Emitter<WeatherPeriodScreenState> emit) async {
    List<Forecast> result =
        await _currentWeatherRepository.getForecast("Minsk");
    emit(state.copyWith(
      forecast: result,
      status: StatusForecast.init,
    ));
  }
}
