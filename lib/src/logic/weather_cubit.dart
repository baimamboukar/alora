import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grnagain/src/app/constants.dart';
import 'package:weather/weather.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

final weatherFactory = WeatherFactory(OPENWEATHER);

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherState.initial());

  // Get current weather by coordinates (lat, lon)
  Future<void> getCurrentWeatherByLocation() async {
    emit(const WeatherState.gettingWeather());

    try {
      final coordinates = await getCoordinates();
      final weather = await weatherFactory.currentWeatherByLocation(
        coordinates.$1, // latitude
        coordinates.$2, // longitude
      );
      emit(WeatherState.gettingWeatherSuccess(weather));
    } catch (e) {
      emit(WeatherState.gettingWeatherFailure(e.toString()));
    }
  }

  // Get weather forecast by coordinates (lat, lon)
  Future<void> getWeatherForecastByLocation() async {
    emit(const WeatherState.gettingForecast());

    try {
      final coordinates = await getCoordinates();
      final forecast = await weatherFactory.fiveDayForecastByLocation(
        coordinates.$1, // latitude
        coordinates.$2, // longitude
      );
      emit(WeatherState.gettingForecastSuccess(forecast));
    } catch (e) {
      emit(WeatherState.gettingForecastFailure(e.toString()));
    }
  }

  // Fetch coordinates using IP-API
  Future<(double, double)> getCoordinates() async {
    try {
      final dio = Dio();
      final response = await dio.get(IPAPI);

      if (response.statusCode == 200) {
        final data = response.data;
        final latitude = data['lat'] as double;
        final longitude = data['lon'] as double;
        return (latitude, longitude);
      } else {
        return Future.error('Failed to get coordinates');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
