import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e32dac077d842071750020ce8a54f0e3';

class WeatherModel {
  late NetworkingHelper networkHelper;

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey,
      'units': 'metric'
    });
    networkHelper = NetworkingHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(cityName) async {
    var url = Uri.https('api.openweathermap.org', 'data/2.5/weather',
        {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    networkHelper = NetworkingHelper(url);
    var cityWeather = await networkHelper.getData();

    return cityWeather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
