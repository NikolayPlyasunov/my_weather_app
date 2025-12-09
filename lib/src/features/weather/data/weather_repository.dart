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
    );
  }
}
