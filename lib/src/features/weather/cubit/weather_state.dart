class WeatherState {
  final bool loading;
  final double? temp;
  final String? city;
  final String? error;
  final double? lat;
  final double? lon;
  final double? feelsLike;
  final double? windSpeed;
  final int? humidity;
  final double? minTemp;
  final double? maxTemp;
  final String? icon;

  WeatherState({
    this.loading = false,
    this.temp,
    this.city,
    this.error,
    this.lat,
    this.lon,
    this.feelsLike,
    this.windSpeed,
    this.humidity,
    this.minTemp,
    this.maxTemp,
    this.icon,
  });

  WeatherState copyWith({
    bool? loading,
    double? temp,
    String? city,
    String? error,
    double? lat,
    double? lon,
    double? feelsLike,
    double? windSpeed,
    int? humidity,
    double? minTemp,
    double? maxTemp,
    String? icon,
  }) => WeatherState(
    loading: loading ?? this.loading,
    temp: temp,
    city: city,
    error: error,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    feelsLike: feelsLike,
    windSpeed: windSpeed,
    humidity: humidity,
    minTemp: minTemp,
    maxTemp: maxTemp,
    icon: icon,
  );
}
