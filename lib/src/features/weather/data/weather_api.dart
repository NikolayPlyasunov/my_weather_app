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

  Future<Map<String, dynamic>> fetchSevenDay(double lat, double lon) async {
    final url = Uri.parse(
      '$oneCallUrl?lat=$lat&lon=$lon&exclude=minutely,hourly,alerts&appid=$openWeatherApiKey&units=metric',
    );

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('OneCall API error');
    }

    return jsonDecode(response.body);
  }
}
