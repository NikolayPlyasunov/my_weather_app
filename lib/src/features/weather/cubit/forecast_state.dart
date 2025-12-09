import 'package:my_weather_app/src/features/weather/data/five_day_forecast_model.dart';

class ForecastState {
  final bool loading;
  final FiveDayForecastModel? forecast;
  final String? error;

  ForecastState({
    this.loading = false,
    this.forecast,
    this.error,
  });

  ForecastState copyWith({
    bool? loading,
    FiveDayForecastModel? forecast,
    String? error,
  }) {
    return ForecastState(
      loading: loading ?? this.loading,
      forecast: forecast ?? this.forecast,
      error: error,
    );
  }
}
