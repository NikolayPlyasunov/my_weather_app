import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants.dart';


class WeatherApi {
    Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse(
      '$baseUrl?q=$city&appid=$openWeatherApiKey&units=metric',
    );
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception('API error');
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> fetchForecast5d(double lat, double lon) async {
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': openWeatherApiKey,
        'units': 'metric',
      },
    );

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Forecast API error: ${response.statusCode}');
    }
    return jsonDecode(response.body);
  }
}