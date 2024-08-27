import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/widgets/weather/day.dart';
import 'package:weather/weather.dart';

@RoutePage()
class ForecastPage extends StatefulWidget {
  final List<Weather> forecast;
  const ForecastPage({super.key, required this.forecast});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // a page view  that will display forecast for 5 days....
    // There should be a smal text before the page view that says "5 day forecast"

    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Day Forecast'),
      ),
      body: Column(
        children: [
          const Text('5 Day Forecast'),
          Expanded(
            child: PageView.builder(
              itemCount: widget.forecast.length,
              itemBuilder: (context, index) {
                final weather = widget.forecast[index];
                return Day(
                  windSpeed: weather.windSpeed.toString(),
                  windDegree: weather.windDegree.toString(),
                  pressure: weather.pressure.toString(),
                  uvi: weather.windDegree.toString(),
                  humidity: weather.humidity.toString(),
                  tempMin: weather.tempMin.toString(),
                  tempMax: weather.tempMax.toString(),
                  icon: weather.weatherIcon!,
                  description: weather.weatherDescription!,
                  summary: weather.weatherMain!,
                  clouds: weather.cloudiness.toString(),
                  dewPoint: weather.windDegree.toString(),
                  windGust: weather.windGust.toString(),
                  morningTemp: weather.temperature!.celsius.toString(),
                  dayTemp: weather.tempMin!.celsius.toString(),
                  eveningTemp: weather.tempFeelsLike!.celsius.toString(),
                  nightTemp: weather.tempFeelsLike!.celsius.toString(),
                  sunrise: weather.sunrise.toString(),
                  sunset: weather.sunset.toString(),
                  moonrise: weather.sunset.toString(),
                  moonset: weather.sunrise.toString(),
                  moonPhase: weather.windSpeed.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
