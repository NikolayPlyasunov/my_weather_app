import 'package:my_weather_app/src/features/weather/data/seven_day_forecast_model.dart';

class ForecastState {
  final bool loading;
  final SevenDayForecastModel? forecast;
  final String? error;

  ForecastState({this.loading = false, this.forecast, this.error});

  ForecastState copyWith({
    bool? loading,
    SevenDayForecastModel? forecast,
    String? error,
  }) => ForecastState(
    loading: loading ?? this.loading,
    forecast: forecast ?? this.forecast,
    error: error,
  );
}
