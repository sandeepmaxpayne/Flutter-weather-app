import 'location.dart';
import 'networking.dart';

const api_key = '086e544faf05295697bbb8d780f496ec';

const openWeatherUrl = 'api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = 'http://$openWeatherUrl?q=$cityName&appid=$api_key&units=metric';
    NetworkData networkData = NetworkData(url: url);
    var weatherData = await networkData.getData();
    return weatherData;
  }

  Future<dynamic> getLocationweather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkData networkData = NetworkData(
        url:
            'http://$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&id=1269750&APPID=$api_key&units=metric');

    var weatherData = await networkData.getData();
    return weatherData;
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
