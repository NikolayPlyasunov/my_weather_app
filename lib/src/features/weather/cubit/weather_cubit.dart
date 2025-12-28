import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repo;
  WeatherCubit(this.repo) : super(WeatherState());

  Future<void> load(String city) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final weather = await repo.getWeather(city);
      emit(
        state.copyWith(
          loading: false,
          temp: weather.temp,
          city: weather.city,
          feelsLike: weather.feelsLike,
          minTemp: weather.minTemp,
          maxTemp: weather.maxTemp,
          windSpeed: weather.windSpeed,
          humidity: weather.humidity,
          lat: weather.lat,
          lon: weather.lon,
          icon: weather.icon,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
