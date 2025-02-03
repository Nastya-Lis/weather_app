import 'package:weather_cast/model/forecast/forecast.dart';
import 'package:weather_cast/model/weather/weather_model.dart';

abstract class WeatherApiInterface {
  Future<Weather> getCurrentWeather(String name);

  Future<List<Forecast>> getForecast(String name);
}
