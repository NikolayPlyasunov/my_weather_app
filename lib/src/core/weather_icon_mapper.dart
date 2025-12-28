import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

IconData mapWeatherIcon(String icon) {
  if (icon.startsWith('01')) return WeatherIcons.day_sunny;
  if (icon.startsWith('02')) return WeatherIcons.day_cloudy;
  if (icon.startsWith('03') || icon.startsWith('04'))
    return WeatherIcons.cloudy;
  if (icon.startsWith('09') || icon.startsWith('10'))
    return WeatherIcons.rain;
  if (icon.startsWith('11')) return WeatherIcons.thunderstorm;
  if (icon.startsWith('13')) return WeatherIcons.snow;
  if (icon.startsWith('50')) return WeatherIcons.fog;

  return WeatherIcons.na;
}
