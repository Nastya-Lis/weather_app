import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:weather_cast/model/forecast/forecast.dart';

import '../../../repository/current_weather_repository/current_weather_repository.dart';
import '../../../repository/shared_preference_repository.dart';

part 'weather_period_screen_event.dart';

part 'weather_period_screen_state.dart';

class WeatherPeriodScreenBloc
    extends Bloc<WeatherPeriodScreenEvent, WeatherPeriodScreenState> {
  final CurrentWeatherRepository _currentWeatherRepository =
      GetIt.I.get<CurrentWeatherRepository>();
  final SharedPreferenceRepository _sharedPreferenceRepository;

  WeatherPeriodScreenBloc({
    required SharedPreferenceRepository sharedPreferenceRepository,
  })  : _sharedPreferenceRepository = sharedPreferenceRepository,
        super(const WeatherPeriodScreenState(
          forecast: null,
        )) {
    on<InitWeatherPeriodEvent>(_initWeatherPeriod);
    on<SwitchWeatherPeriodEvent>(_switchWeatherPeriod);
  }

  FutureOr<void> _initWeatherPeriod(InitWeatherPeriodEvent event,
      Emitter<WeatherPeriodScreenState> emit) async {
    List<Forecast>? result =
        await _currentWeatherRepository.getForecast("Minsk");
    emit(state.copyWith(
      forecast: result,
      status: StatusForecast.init,
    ));
  }

  FutureOr<void> _switchWeatherPeriod(SwitchWeatherPeriodEvent event,
      Emitter<WeatherPeriodScreenState> emit) async {
    List<Forecast>? result =
        await _currentWeatherRepository.getForecast(event.location);
    _sharedPreferenceRepository.setLocationName(event.location);
    emit(state.copyWith(
      forecast: result,
      status: StatusForecast.success,
    ));
  }
}
