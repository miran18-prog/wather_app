import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wather_app/api/api_services.dart';
import 'package:wather_app/colors/colors.dart';
import 'package:wather_app/src/widgets/main_tempreture_widget.dart';
import 'package:wather_app/src/widgets/upper_section.dart';
import 'package:wather_app/src/widgets/weather_code_icon.dart';
import 'package:wather_app/src/widgets/weather_conditions_widget.dart';
import 'package:weather/weather.dart';

import 'package:weather_icons/weather_icons.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getFiveDayForecast();
  }

  List<Weather> fiveDaysWeather = [];
  void getFiveDayForecast() async {
    WeatherFactory wf = WeatherFactory(ApiServices.apiKey);
    final cityName = ref.read(cityNameProvider);
    fiveDaysWeather = await wf.fiveDayForecastByCityName(cityName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(weatherApiProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: weatherData.when(data: (weather) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 17, top: 13),
              width: MediaQuery.of(context).size.width,
              height: 75,
              child: UpperSecrion(weather: weather),
            ),
            Container(
              height: 137,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 50, top: 20),
              child: MainTempretureWidget(weather: weather),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 96,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherConditionsWidget(
                    weatherConditionValue: weather.humidity!,
                    weatherIcon: WeatherIcons.humidity,
                    weatherCondition: 'humidity',
                  ),
                  WeatherConditionsWidget(
                    weatherConditionValue: weather.cloudiness!,
                    weatherIcon: WeatherIcons.cloud,
                    weatherCondition: 'cloudiness',
                  ),
                  WeatherConditionsWidget(
                      weatherConditionValue: weather.windSpeed!,
                      weatherIcon: WeatherIcons.windy,
                      weatherCondition: 'windspeed'),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        amOrPm(fiveDaysWeather[index].date!),
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      WeatherIcon(
                        size: 25,
                        weatherCode: fiveDaysWeather[index].weatherIcon!,
                      ),
                      Text(
                        (fiveDaysWeather[index].temperature!.celsius!.toInt())
                            .toString(),
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        );
      }, error: (w, err) {
        return Text(err.toString());
      }, loading: () {
        return Center(
            child: SizedBox(
          height: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [primaryButtonColor],
          ),
        ));
      }),
    );
  }

  String amOrPm(DateTime x) {
    if (x.hashCode > 12 && x.hashCode < 24) {
      return "${x.hour}:00 PM";
    }
    return "${x.hour}:00 AM";
  }
}
