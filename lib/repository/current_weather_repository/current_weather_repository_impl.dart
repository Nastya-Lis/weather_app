import 'package:get_it/get_it.dart';
import 'package:weather_cast/model/forecast/forecast.dart';
import 'package:weather_cast/model/weather/weather_model.dart';
import 'package:weather_cast/repository/current_weather_repository/current_weather_repository.dart';
import 'package:weather_cast/service/api/weather_api/weather_api.dart';

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository{
  final WeatherApiInterface _weatherApiInterface =
  GetIt.I.get<WeatherApiInterface>(instanceName: "WeatherApiImpl");

  @override
  Future<Weather> getCurrentWeather(String name) {
    return _weatherApiInterface.getCurrentWeather(name);
  }

  @override
  Future<Weather> getFullInfoCurrentWeather() {
    // TODO: implement getFullInfoCurrentWeather
    throw UnimplementedError();
  }

  @override
  Future<List<Forecast>> getForecast(String name) {
    return _weatherApiInterface.getForecast(name);
  }
  
}
