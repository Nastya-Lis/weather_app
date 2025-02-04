import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_cast/model/time_of_day.dart';
import 'package:weather_cast/model/weather/weather_model.dart';
import 'package:weather_cast/repository/current_weather_repository/current_weather_repository.dart';

import '../../../model/converter/date_converter.dart';
import '../../../repository/shared_preference_repository.dart';
import '../../../service/geolocator/geolocator_service.dart';

part 'current_weather_screen_event.dart';

part 'current_weather_screen_state.dart';

class CurrentWeatherScreenBloc
    extends Bloc<CurrentWeatherScreenEvent, CurrentWeatherScreenState> {
  final CurrentWeatherRepository _currentWeatherRepository =
      GetIt.I.get<CurrentWeatherRepository>();
  final GeoLocatorService _geoLocatorService = GetIt.I.get<GeoLocatorService>();
  final SharedPreferenceRepository _sharedPreferenceRepository;

  CurrentWeatherScreenBloc(
      {required SharedPreferenceRepository sharedPreferenceRepository})
      : _sharedPreferenceRepository = sharedPreferenceRepository,
        super(const CurrentWeatherScreenState(weather: null)) {
    on<InitCurrentWeatherScreenEvent>(_initCurrentWeather);
    on<SwitchLocationWeatherScreenEvent>(_switchLocationWeather);
    on<GeoLocatorCurrentWeatherScreenEvent>(_geoLocatorCurrentWeather);
    on<UpdateCurrentWeatherScreenEvent>(_updateCurrentWeather);
  }

  FutureOr<void> _initCurrentWeather(InitCurrentWeatherScreenEvent event,
      Emitter<CurrentWeatherScreenState> emit) async {
    emit(state.copyWith(
      status: StatusCurrentWeather.loading,
    ));
    Position position = await _geoLocatorService.getPosition();
    Weather? result = await _currentWeatherRepository
        .getCurrentWeather("${position.latitude},${position.longitude}");
    if (result != null) {
      _sharedPreferenceRepository.setLocationName(result.location?.name ?? "");
      emit(state.copyWith(
        weather: result,
        timeOfDayEnum: TimeOfDayEnum.getCurrentTimeDay(
          timeOfDayConverter(result.current?.lastUpdated),
        ),
        status: StatusCurrentWeather.init,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: _currentWeatherRepository.getErrorMessage(),
        status: StatusCurrentWeather.error,
      ));
    }
  }

  FutureOr<void> _switchLocationWeather(SwitchLocationWeatherScreenEvent event,
      Emitter<CurrentWeatherScreenState> emit) async {
    Weather? result =
        await _currentWeatherRepository.getCurrentWeather(event.nameLocation);
    if (result != null) {
      emit(state.copyWith(
        weather: result,
        status: StatusCurrentWeather.success,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: _currentWeatherRepository.getErrorMessage(),
        status: StatusCurrentWeather.error,
      ));
    }
  }

  FutureOr<void> _updateCurrentWeather(UpdateCurrentWeatherScreenEvent event,
      Emitter<CurrentWeatherScreenState> emit) async {
    String? nameLocation = state.weather?.location?.name;
    Weather? result;
    if (nameLocation != null) {
      result = await _currentWeatherRepository.getCurrentWeather(nameLocation);
    } else {
      Position position = await _geoLocatorService.getPosition();
      result = await _currentWeatherRepository
          .getCurrentWeather("${position.latitude},${position.longitude}");
    }
    if (result != null) {
      emit(state.copyWith(
        weather: result,
        status: StatusCurrentWeather.success,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: _currentWeatherRepository.getErrorMessage(),
        status: StatusCurrentWeather.error,
      ));
    }
  }

  FutureOr<void> _geoLocatorCurrentWeather(
      GeoLocatorCurrentWeatherScreenEvent event,
      Emitter<CurrentWeatherScreenState> emit) {}
}
