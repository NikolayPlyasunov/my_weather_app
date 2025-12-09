class DailyForecastModel {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String icon;

  DailyForecastModel({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });
}

