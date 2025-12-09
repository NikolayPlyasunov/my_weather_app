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
        appBar: AppBar(title: const Text("5-Day Forecast")),
        body: BlocBuilder<ForecastCubit, ForecastState>(
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

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.network(
                      "https://openweathermap.org/img/wn/${d.icon}@2x.png",
                      width: 50,
                    ),
                    title: Text(formatted),
                    subtitle: Text("Min: ${d.minTemp.round()}°C "
"Max: ${d.maxTemp.round()}°C"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
