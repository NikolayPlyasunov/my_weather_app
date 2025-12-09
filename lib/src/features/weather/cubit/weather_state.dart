class WeatherState {
  final bool loading;
  final double? temp;
  final String? city;
  final String? error;
  final double? lat;
  final double? lon;

  WeatherState({
    this.loading = false,
    this.temp,
    this.city,
    this.error,
    this.lat,
    this.lon,
  });

  WeatherState copyWith({
    bool? loading,
    double? temp,
    String? city,
    String? error,
    double? lat,
    double? lon,
  }) => WeatherState(
    loading: loading ?? this.loading,
    temp: temp,
    city: city,
    error: error,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
  );
}
