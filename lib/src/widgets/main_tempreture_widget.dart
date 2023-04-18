// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';

import 'package:wather_app/src/widgets/weather_code_icon.dart';

class MainTempretureWidget extends StatelessWidget {
  final Weather weather;
  const MainTempretureWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(builder: (context) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    (weather.temperature!.celsius!.toInt()).toString(),
                    style: GoogleFonts.dmSans(
                      color: Colors.grey.shade200,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: const Icon(
                      Icons.circle,
                      size: 20,
                      weight: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                weather.weatherMain!,
                style: GoogleFonts.dmSans(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }),
        Expanded(
            child: WeatherIcon(
          weatherCode: weather.weatherIcon!,
          size: 125,
        )),
      ],
    );
  }
}
