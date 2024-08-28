import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/num.dart';
import 'package:grnagain/src/extensions/widgetx.dart';
import 'package:grnagain/src/widgets/weather/day.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

@RoutePage()
class ForecastPage extends StatefulWidget {
  final List<Weather> forecast;
  const ForecastPage({super.key, required this.forecast});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // a page view  that will display forecast for 5 days....
    // There should be a smal text before the page view that says "5 day forecast"

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Column(
        children: [
          // Text(
          //   '5 Days Weather Forecast',
          //   style: context.head,
          // ).floatL.hPaddingx(24),
          14.vGap,
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.forecast.length,
              itemBuilder: (context, index) {
                final weather = widget.forecast[index];
                return Column(
                  children: [
                    // Format date using intl package like "Mon, 12 July 2021"
                    Builder(builder: (context) {
                      final format = DateFormat('E, d MMM yyyy');
                      final formattedDate = format.format(weather.date!);
                      return Text(
                        formattedDate,
                        style: context.head,
                      ).floatL.hPaddingx(24);
                    }),

                    Day(
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
                    ),
                  ],
                );
              },
            ),
          ),
          // Next and Previous buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
                label: const Text('Previous'),
              ),
              TextButton.icon(
                icon: const Text('Next'),
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                label: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ).hPaddingx(24),
        ],
      ),
    );
  }
}
