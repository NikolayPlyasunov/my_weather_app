import 'package:my_weather_app/src/features/weather/data/daily_forecast_model.dart';
import 'package:my_weather_app/src/features/weather/data/five_day_forecast_model.dart';
import 'package:my_weather_app/src/features/weather/data/weather_model.dart';

import 'weather_api.dart';



class WeatherRepository {
  final WeatherApi api;
  WeatherRepository(this.api);

  Future<WeatherModel> getWeather(String city) async {
  final data = await api.fetchWeather(city);
  return WeatherModel(
    city: data['name'],
    temp: (data['main']['temp']).toDouble(),
    lat: data['coord']['lat'],
    lon: data['coord']['lon'],
    feelsLike: (data['main']['feels_like']).toDouble(),
      windSpeed: (data['wind']['speed']).toDouble(),
  humidity: data['main']['humidity'],
  minTemp: (data['main']['temp_min']).toDouble(),
  maxTemp: (data['main']['temp_max']).toDouble(),
  icon: data['weather'][0]['icon'],
  );
}

  Future<FiveDayForecastModel> getForecast5d(double lat, double lon) async {
    final data = await api.fetchForecast5d(lat, lon);
    final list = data['list'] as List;

    final Map<String, List<dynamic>> grouped = {};

    for (var entry in list) {
      final dt = DateTime.fromMillisecondsSinceEpoch(entry['dt'] * 1000);
      final key = "${dt.year}-${dt.month}-${dt.day}";
      grouped.putIfAbsent(key, () => []).add(entry);
    }

    final List<DailyForecastModel> days = [];

    grouped.forEach((key, entries) {
      double minTemp = double.infinity;
      double maxTemp = -double.infinity;
      String icon = entries.first['weather'][0]['icon'];

      for (var e in entries) {
        final t = (e['main']['temp'] as num).toDouble();
        if (t < minTemp) minTemp = t;
        if (t > maxTemp) maxTemp = t;
      }

      final parts = key.split('-');
      final date = DateTime(
        int.parse(parts[0]),
        int.parse(parts[1]),
        int.parse(parts[2]),
      );

      days.add(DailyForecastModel(
        date: date,
        minTemp: minTemp,
        maxTemp: maxTemp,
        icon: icon,

      ));
    });

    days.sort((a, b) => a.date.compareTo(b.date));
    return FiveDayForecastModel(days: days);
  }
}
