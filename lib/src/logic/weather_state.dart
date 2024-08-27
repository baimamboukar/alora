part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.gettingForecast() = _Getting;
  const factory WeatherState.gettingForecastSuccess(List<Weather> forecast) =
      _GettingSuccess;
  const factory WeatherState.gettingForecastFailure(String message) =
      _GettingFailure;

  // Getting weather states
  const factory WeatherState.gettingWeather() = _GettingWeather;
  const factory WeatherState.gettingWeatherSuccess(Weather weather) =
      _GettingWeatherSuccess;
  const factory WeatherState.gettingWeatherFailure(String message) =
      _GettingWeatherFailure;
}
