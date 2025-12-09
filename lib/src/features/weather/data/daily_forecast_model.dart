class DailyForecastModel {
  final int dt;
  final double minTemp;
  final double maxTemp;
  final String icon;

  DailyForecastModel({
    required this.dt,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      dt: json['dt'],
      minTemp: json['temp']['min'].toDouble(),
      maxTemp: json['temp']['max'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}
