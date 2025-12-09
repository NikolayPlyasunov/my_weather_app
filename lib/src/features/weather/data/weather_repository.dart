import 'package:my_weather_app/src/features/weather/data/seven_day_forecast_model.dart';

import 'weather_api.dart';
import 'weather_model.dart';

class WeatherRepository {
  final WeatherApi api;
  WeatherRepository(this.api);

  Future<WeatherModel> getWeather(String city) async {
    final data = await api.fetchWeather(city);
    return WeatherModel(
      city: data['name'],
      temp: (data['main']['temp']).toDouble(),
      lat: data['coord']['lat'].toDouble(),
      lon: data['coord']['lon'].toDouble(),
    );
  }

  Future<SevenDayForecastModel> getSevenDayForecast(
    double lat,
    double lon,
  ) async {
    final json = await api.fetchSevenDay(lat, lon);
    return SevenDayForecastModel.fromJson(json);
  }
}
