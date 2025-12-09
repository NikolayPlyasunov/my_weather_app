import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/src/features/weather/data/weather_api.dart';
import 'package:my_weather_app/src/features/weather/data/weather_repository.dart';
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
        appBar: AppBar(title: const Text('Weather Pro')),
        body: const _Body(),
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
  final controller = TextEditingController(text: 'London');

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'City'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => cubit.load(controller.text),
            child: const Text('Load Weather'),
          ),
          const SizedBox(height: 16),
          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state.loading) return const CircularProgressIndicator();
              if (state.error != null) return Text('Error: ${state.error}');
              if (state.temp == null) return const Text('Enter a city');
              return WeatherCard(city: state.city!, temp: state.temp!);
            },
          ),
        ],
      ),
    );
  }
}
