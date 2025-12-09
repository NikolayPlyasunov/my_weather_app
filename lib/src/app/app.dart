import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../features/weather/presentation/pages/home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.light, home: const HomePage());
  }
}
