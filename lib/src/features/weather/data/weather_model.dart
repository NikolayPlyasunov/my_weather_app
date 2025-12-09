import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel {
  @HiveField(0)
  final String city;

  @HiveField(1)
  final double temp;

  WeatherModel({required this.city, required this.temp});
}
