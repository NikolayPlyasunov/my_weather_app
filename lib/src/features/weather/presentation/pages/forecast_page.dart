import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/src/core/weather_icon_mapper.dart';
import 'package:my_weather_app/src/features/weather/data/weather_api.dart';
import 'package:my_weather_app/src/features/weather/data/weather_repository.dart';

import '../../cubit/forecast_cubit.dart';
import '../../cubit/forecast_state.dart';

class ForecastPage extends StatelessWidget {
  final double lat;
  final double lon;


  const ForecastPage({super.key, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ForecastCubit(WeatherRepository(WeatherApi()))..load(lat, lon),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('5-Day Forecast'),
         // backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
            ),
          ),
          child: BlocBuilder<ForecastCubit, ForecastState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.error != null) {
                return Center(child: Text(state.error!));
              }

              final days = state.forecast!.days;

              return ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, i) {
                  final d = days[i];
                  final formatted =
                      "${d.date.day}.${d.date.month}.${d.date.year}";

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          "https://openweathermap.org/img/wn/${d.icon}@2x.png",
                          width: 48,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "${_formatDate(d.date)} · ${_weekday(d.date)}",
  style: const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
                            ),
                          ),
                        
          Text(
  "${d.minTemp.round()}°",
  style: const TextStyle(
    color: Color(0xFFB3E5FC), // холодный голубой
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
),
const SizedBox(width: 10),
Text(
  "${d.maxTemp.round()}°",
  style: const TextStyle(
    color: Color(0xFFFFF9C4), // тёплый жёлтый
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

String _weekday(DateTime date) {
  const days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  return days[date.weekday % 7];
}

String _formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return "$day.$month";
}
