import 'package:flutter/material.dart';
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

  @HiveField(4)
  final double feelsLike;

  @HiveField(5)
  final double windSpeed;

  @HiveField(6)
  final int humidity;

  @HiveField(7)
  final double minTemp;

  @HiveField(8)
  final double maxTemp;

    @HiveField(9)
  final String icon;

    @HiveField(10)
  final String country;


  WeatherModel({
    required this.city,
    required this.temp,
    required this.lat,
    required this.lon,
    required this.feelsLike,
    required this.windSpeed,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
    required this.country,
  });
}
