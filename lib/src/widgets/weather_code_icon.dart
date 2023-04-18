import 'package:flutter/material.dart';
import 'package:wather_app/colors/colors.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherCode;
  final double size;
  WeatherIcon({required this.weatherCode, required this.size});

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    switch (weatherCode) {
      case "01d":
        iconData = WeatherIcons.day_sunny;
        break;
      case "01n":
        iconData = WeatherIcons.night_clear;
        break;
      case "02d":
        iconData = WeatherIcons.day_cloudy;
        break;
      case "02n":
        iconData = WeatherIcons.night_cloudy;
        break;
      case "03d":
      case "03n":
      case "04d":
      case "04n":
        iconData = WeatherIcons.cloudy;
        break;
      case "09d":
      case "09n":
        iconData = WeatherIcons.showers;
        break;
      case "10d":
        iconData = WeatherIcons.day_rain;
        break;
      case "10n":
        iconData = WeatherIcons.night_rain;
        break;
      case "11d":
      case "11n":
        iconData = WeatherIcons.thunderstorm;
        break;
      case "13d":
      case "13n":
        iconData = WeatherIcons.snow;
        break;
      case "50d":
      case "50n":
        iconData = WeatherIcons.fog;
        break;
      default:
        iconData = WeatherIcons.alien;
        break;
    }
    return Icon(
      iconData,
      size: size,
      color: primaryButtonColor,
    );
  }
}
