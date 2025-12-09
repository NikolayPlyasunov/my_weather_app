import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/weather_repository.dart';
import 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final WeatherRepository repo;

  ForecastCubit(this.repo) : super(ForecastState());

  Future<void> load(double lat, double lon) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final data = await repo.getForecast5d(lat, lon);
      emit(state.copyWith(loading: false, forecast: data));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
