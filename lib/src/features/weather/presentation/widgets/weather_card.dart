import 'package:flutter/material.dart';
import 'package:my_weather_app/src/core/weather_icon_mapper.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double temp;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;
  final int humidity;
  final String icon;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.humidity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(mapWeatherIcon(icon), size: 70, color: Colors.white),
        const SizedBox(height: 8),
        // Temperature
        Text(
          '${temp.round()}°',
          style: const TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Text(
          city,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Feels like
        Text(
          'Feels like ${feelsLike.round()}°',
          style: const TextStyle(
            fontSize: 18, 
            color: Colors.white,
            fontWeight: FontWeight.w600
            ),
        ),

        const SizedBox(height: 20),

        // Min / Max
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _infoItem('Min', minTemp),
            const SizedBox(width: 24),
            _infoItem('Max', maxTemp, isMax: true),
          ],
        ),

        const SizedBox(height: 16),

        // Wind / Humidity
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textInfo('Wind', '${windSpeed.toStringAsFixed(1)} m/s'),
            const SizedBox(width: 24),
            _textInfo('Humidity', '$humidity%'),
          ],
        ),
      ],
    );
  }

  Widget _infoItem(String label, double value, {bool isMax = false}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text(
          '${value.round()}°',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: isMax ? const Color(0xFFFFF9C4) : const Color(0xFFB3E5FC),
          ),
        ),
      ],
    );
  }

  Widget _textInfo(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
