import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "1e6cdde6050aaa48c96eac739b9911b2";
const urlAPI = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    var url = "$urlAPI?q=$city&appid=$apiKey";

    Networking networking = Networking(url: url);
    var data = await networking.getData();
    return data;
  }

  Future<dynamic> getLocationweather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url =
        "$urlAPI?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey";

    Networking networking = Networking(url: url);
    var data = await networking.getData();
    return data;
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
