import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double temp;

  const WeatherCard({super.key, required this.city, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(city, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text('${temp.round()} °C', style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
