import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_cast/model/forecast/forecast.dart';
import 'package:weather_cast/model/weather/weather_model.dart';
import 'package:weather_cast/service/api/weather_api/weather_api.dart';

import '../dio_service.dart';

class WeatherApiImpl extends WeatherApiInterface {
  final NetworkConnector networkService =
      GetIt.I.get<NetworkConnector>(instanceName: "NetworkConnector");

  @override
  Future<Weather> getCurrentWeather(String name) async {
    Response response = await networkService.dio.get(
      "/current.json",
      queryParameters: {"q": name},
    );
    dynamic result = response.data;
    return Weather.fromJson(result);
  }

  @override
  Future<List<Forecast>> getForecast(String name) async {
    List<Forecast> result = [];
    Response response = await networkService.dio.get(
      "/forecast.json",
      queryParameters: {"days": 7, "q": name},
    );
    var fullResult = response.data as Map<String, dynamic>;
    Map<String, dynamic> forecast = fullResult["forecast"];
    List<dynamic> cast = forecast["forecastday"];
    for (var e in cast) {
      result.add(Forecast.fromJson(e));
    }
    return result;
  }
}
