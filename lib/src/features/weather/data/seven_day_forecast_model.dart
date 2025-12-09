import 'daily_forecast_model.dart';

class SevenDayForecastModel {
  final List<DailyForecastModel> daily;

  SevenDayForecastModel({required this.daily});

  factory SevenDayForecastModel.fromJson(Map<String, dynamic> json) {
    final list = (json['daily'] as List)
        .take(7)
        .map((e) => DailyForecastModel.fromJson(e))
        .toList();

    return SevenDayForecastModel(daily: list);
  }
}
