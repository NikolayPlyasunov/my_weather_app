import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/src/features/weather/data/weather_api.dart';
import 'package:my_weather_app/src/features/weather/data/weather_repository.dart';
import 'package:my_weather_app/src/features/weather/presentation/pages/forecast_page.dart';
import '../../cubit/weather_cubit.dart';
import '../../cubit/weather_state.dart';
import '../widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(WeatherRepository(WeatherApi())),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Weather',
             style: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      ),
      
          ),
          flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
      ),
    ),
    
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
            ),
          ),
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final controller = TextEditingController(text: 'Chelyabinsk');

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
        TextField(
  controller: controller,
  style: const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  decoration: const InputDecoration(
    labelText: 'City',
    labelStyle: TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white38),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
),

          const SizedBox(height: 12),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => cubit.load(controller.text),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Load Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state.loading) return const CircularProgressIndicator();
              if (state.error != null) return Text('Error: ${state.error}');
              if (state.temp == null) {
                return const Text(
                'Enter a city', 
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),);
              }

              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: WeatherCard(
                      city: state.city!,
                      temp: state.temp!,
                      feelsLike: state.feelsLike!,
                      minTemp: state.minTemp!,
                      maxTemp: state.maxTemp!,
                      windSpeed: state.windSpeed!,
                      humidity: state.humidity!,
                      icon: state.icon!,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ForecastPage(lat: state.lat!, lon: state.lon!,),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5-Day Forecast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
