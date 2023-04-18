import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherConditionsWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final double weatherConditionValue;
  final IconData? weatherIcon;
  final String weatherCondition;
  const WeatherConditionsWidget({
    super.key,
    required this.weatherConditionValue,
    required this.weatherIcon,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade900,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                weatherIcon!,
                color: Colors.grey.shade700,
              ),
              const SizedBox(height: 10),
              Text(
                weatherConditionValue.toString(),
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          weatherCondition.toString(),
          style: GoogleFonts.dmSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
