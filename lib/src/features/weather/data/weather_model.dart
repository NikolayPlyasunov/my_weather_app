import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel {
  @HiveField(0)
  final String city;

  @HiveField(1)
  final double temp;

  @HiveField(2)
  final double lat;

  @HiveField(3)
  final double lon;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.lat,
    required this.lon,
  });
}
