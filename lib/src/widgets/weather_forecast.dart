import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/num.dart';
import 'package:grnagain/src/logic/weather_cubit.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:grnagain/src/widgets/weather/frosted_glass.dart';
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
          gettingForecastSuccess: (forecast) {
            final Weather weather = forecast.firstOrNull!;
            return Center(
              child: Column(
                children: [
                  // 20.vGap,
                  GestureDetector(
                    onTap: () => context.router.push(
                      ForecastRoute(forecast: forecast),
                    ),
                    child: FrostedGlass(
                      isPreview: true,
                      date: weather.date!,
                      tempMin: weather.tempMin!.celsius!.toStringAsFixed(4),
                      tempMax: weather.tempMax!.celsius!.toStringAsFixed(4),
                      icon: weather.weatherIcon!,
                      description: weather.weatherDescription!,
                    ),
                  ),
                  //14.vGap,
                  // TextButton(
                  //   onPressed: () => context.router.push(
                  //     ForecastRoute(forecast: forecast),
                  //   ),
                  //   child: const Text('View Weather Forecast'),
                  // )

                  // Builder(builder: (context) {
                  //   final Weather weather = forecast.firstOrNull!;
                  //   return TextButton(
                  //     onPressed: () => context.router.push(
                  //       ForecastRoute(forecast: forecast),
                  //     ),
                  //     child: const Text('View Forecast'),
                  //   );
                  // })
                ],
              ),
            );
          },
          gettingForecastFailure: (error) => Center(
            child: Column(
              children: [
                // display a resfresh button
                Text('Failed to get weather forecast',
                    style: context.paragraph
                        .copyWith(color: context.colorScheme.error)),
                10.vGap,
                TextButton(
                    onPressed: () => context
                        .read<WeatherCubit>()
                        .getWeatherForecastByLocation(),
                    child: const Text('Retry')),
                // retyr button
              ],
            ),
          ),
        );
      },
    );
  }
}
