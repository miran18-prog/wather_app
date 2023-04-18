import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

final provider = Provider<ApiServices>((ref) {
  return ApiServices();
});


final cityNameProvider = StateProvider<String>((ref) => "shaqlawa");

final weatherApiProvider = FutureProvider<Weather>((ref) async {
  final cityName = ref.read(cityNameProvider);
  return ref.read(provider).getWeatherByCityName(cityName);
});

final dailyWeatherProvider = FutureProvider<List<Weather>>((ref) async {
  final cityName = ref.read(cityNameProvider);
  return ref.read(provider)._getHourlyData(cityName: cityName);
});

class ApiServices {
  static String apiKey = '520bd400d1c01508ddda184d304e208b';
  WeatherFactory wf = WeatherFactory('520bd400d1c01508ddda184d304e208b');

  Future<Weather> getWeatherByCityName(String cityName) async {
    Weather w = await wf.currentWeatherByCityName(cityName);

    return w;
  }

  Future<List<Weather>> _getHourlyData({required String cityName}) async {
    List<Weather> hourly = await wf.fiveDayForecastByCityName(cityName);
    return hourly;
  }
}
