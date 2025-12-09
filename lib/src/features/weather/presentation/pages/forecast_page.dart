import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        appBar: AppBar(title: const Text("7-Day Forecast")),
        body: BlocBuilder<ForecastCubit, ForecastState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            }

            final list = state.forecast!.daily;

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 24, thickness: 1),
              itemBuilder: (_, i) {
                final day = list[i];
                final date = DateTime.fromMillisecondsSinceEpoch(day.dt * 1000);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${date.day}.${date.month}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text("${day.minTemp.round()}°"),
                        const SizedBox(width: 4),
                        Text(
                          "${day.maxTemp.round()}°",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      "https://openweathermap.org/img/wn/${day.icon}.png",
                      width: 40,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
