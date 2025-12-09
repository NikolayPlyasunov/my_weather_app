class WeatherState {
  final bool loading;
  final double? temp;
  final String? city;
  final String? error;

  WeatherState({this.loading = false, this.temp, this.city, this.error});

  WeatherState copyWith({
    bool? loading,
    double? temp,
    String? city,
    String? error,
  }) => WeatherState(
    loading: loading ?? this.loading,
    temp: temp,
    city: city,
    error: error,
  );
}
