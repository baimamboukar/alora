import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grnagain/src/extensions/num.dart';
import 'package:grnagain/src/logic/weather_cubit.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:weather/weather.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherForecastByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
          gettingForecast: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
          gettingForecastSuccess: (forecast) => Center(
            child: Column(
              children: [
                Text(
                  forecast.firstOrNull!.rainLast3Hours.toString(),
                ),
                20.vGap,
                Builder(builder: (context) {
                  final Weather weather = forecast.firstOrNull!;
                  return TextButton(
                    onPressed: () => context.router.push(
                      ForecastRoute(forecast: forecast),
                    ),
                    child: const Text('View Forecast'),
                  );
                  // return Day(
                  //   windSpeed: weather.windSpeed.toString(),
                  //   windDegree: weather.windDegree.toString(),
                  //   pressure: weather.pressure.toString(),
                  //   uvi: weather.windDegree.toString(),
                  //   humidity: weather.humidity.toString(),
                  //   tempMin: weather.tempMin.toString(),
                  //   tempMax: weather.tempMax.toString(),
                  //   icon: weather.weatherIcon!,
                  //   description: weather.weatherDescription!,
                  //   summary: weather.weatherMain!,
                  //   clouds: weather.cloudiness.toString(),
                  //   dewPoint: weather.windDegree.toString(),
                  //   windGust: weather.windGust.toString(),
                  //   morningTemp: weather.temperature!.celsius.toString(),
                  //   dayTemp: weather.tempMin!.celsius.toString(),
                  //   eveningTemp: weather.tempFeelsLike!.celsius.toString(),
                  //   nightTemp: weather.tempFeelsLike!.celsius.toString(),
                  //   sunrise: weather.sunrise.toString(),
                  //   sunset: weather.sunset.toString(),
                  //   moonrise: weather.sunset.toString(),
                  //   moonset: weather.sunrise.toString(),
                  //   moonPhase: weather.windSpeed.toString(),
                  // );
                })
              ],
            ),
          ),
          gettingForecastFailure: (error) => Center(
            child: Text(error),
          ),
        );
      },
    );
  }
}
